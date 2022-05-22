# Render themes, creates them as separate files and as
# one combined file `themes.yaml`.
# Part of https://github.com/basnijholt/lovelace-ios-themes
# Adapted for own liking

from pathlib import Path

import os
import sys
import jinja2
import yaml
from PIL import Image
from PIL import ImageColor

terminal_cwd=os.getcwd()
abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)
os.chdir(dname)

with open("settings-light-dark.yaml", "r") as f:
  all_settings = yaml.safe_load(f)


def parse(x):
  return x if "#" not in x else f'"{x}"'


def average_color(fname):
  color = Image.open(fname).resize((1, 1)).getpixel((0, 0))
  hex_color = "#{:02x}{:02x}{:02x}".format(*color)
  rgb_color = ImageColor.getrgb(hex_color)
  return "rgba({}, {}, {}, 0.4)".format(*rgb_color)

config_folder = None
if len(sys.argv) > 1:
  config_folder = Path(sys.argv[1])
  if not os.path.isabs(config_folder):
    config_folder = os.path.abspath(os.path.join(Path(terminal_cwd), config_folder))
  if not os.path.isdir(config_folder):
    print('create_themes.py: Given config folder not a valid directory. Trying to locate it...')
if config_folder is None:
  tempfolder=Path(dname)
  config_folder = None
  while tempfolder.parent != tempfolder:
    toCheck = os.path.join(tempfolder, "config")
    if os.path.isdir(toCheck):
      config_folder = toCheck
      break
    tempfolder = tempfolder.parent
if config_folder is None:
  sys.stderr.print('create_themes.py: Could not find configuration folder. Exiting.')
  exit(1)

folder_fname = [
  ("local", Path(os.path.join(config_folder, "themes.yaml"))),
]

for folder, fname in folder_fname:
  fname.parent.mkdir(parents=True, exist_ok=True)
  with fname.open("w") as f:
    theme_includes=[
      os.path.join(config_folder, "themes-include.yaml"),
      os.path.join(dname, "themes-include.yaml")
    ]
    for include in theme_includes:
      if os.path.isfile(include):
        f.write("# Included from " + include + "\n")
        with open(include, "r") as f_include:
          f.write(f_include.read())
        f.write("\n")
    f.write("# From https://github.com/basnijholt/lovelace-ios-themes\n")
  with open("template.jinja2") as f_template:
    template = jinja2.Template("".join(f_template.readlines()))
  for background in sorted(Path("../www/themes/ios-themes").glob("homekit-bg-*.jpg")):
    color = background.stem.split("homekit-bg-")[-1]
    app_header_background_color = average_color(background)
    for which in ["dark", "light"]:
      for state_icon_yellow in [True]:
        settings = {k: parse(v[which])
            for k, v in all_settings.items()}

        if state_icon_yellow:
          settings["state_icon_active_color"] = "rgba(255, 214, 10, 1)"
          suffix = ""
        else:
          suffix = "-alternative"

        result = template.render(
          **settings,
          folder=folder,
          which=which,
          app_header_background_color=app_header_background_color,
          background_jpg=str(background.name),
          color=color,
          suffix=suffix,
        )

        with fname.open("a") as f:
          f.write("\n" + result + "\n")
