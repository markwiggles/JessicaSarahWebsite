SimpleNavigation::Configuration.run do |navigation|


  navigation.items do |primary|

    primary.item :home, 'HOME', '/home', :class => 'nav-border-left nav-border-top'
    primary.item :bio, 'BIO', '/bio', :class => 'nav-border-left nav-border-top'
    primary.item :music, 'MUSIC', :class => 'nav-border-left nav-border-top' do |music|
      music.item :tracks, 'TRACKS', '/tracks'
      music.item :video, 'VIDEO', '/video'
    end

    primary.item :pics, 'PHOTOS', :class => 'nav-border-left nav-border-top' do |photo|
      photo.item :pics, 'PICS', '/pics'
      photo.item :art, 'ART', '/art'
    end
    primary.item :follow, 'FOLLOW', '/follow', :class => 'nav-border-left nav-border-top'
    primary.item :contact, 'CONTACT', '/contact',:class => 'nav-border-top'

    primary.dom_class = 'nav navbar-nav'

  end

end