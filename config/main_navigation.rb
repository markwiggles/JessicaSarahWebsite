SimpleNavigation::Configuration.run do |navigation|


  navigation.items do |primary|

    primary.item :home, 'HOME', '/home', :class => 'nav-border-left nav-border-top'
    primary.item :bio, 'BIO', '/bio', :class => 'nav-border-left nav-border-top'
    primary.item :tracks, 'TRACKS', '/tracks', :class => 'nav-border-left nav-border-top'
    primary.item :video, 'VIDEO', '/video', :class => 'nav-border-left nav-border-top'
    primary.item :pics, 'PICS', '/pics', :class => 'nav-border-left nav-border-top'
    primary.item :art, 'ART', '/art', :class => 'nav-border-top'


    primary.dom_class = 'nav navbar-nav'

  end

end


# primary.item :follow, 'FOLLOW', '/follow', :class => 'nav-border-left nav-border-top'
# primary.item :contact, 'CONTACT', '/contact', :class => 'nav-border-top'