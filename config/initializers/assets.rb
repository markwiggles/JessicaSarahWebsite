# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w(
cyborg.css cyborg.js cerulean.css cerulean.js pdf/viewer.css pdf/web/compatibility.js
pdf/web/l10n.js pdf/pdf.js pdf/web/debugger.js pdf/web/viewer.js)


# Let Rails find the directories under models
Rails.application.config.autoload_paths += %W( #{Rails.root.to_s}/app/models/role #{Rails.root.to_s}/app/models/user )

