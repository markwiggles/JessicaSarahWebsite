SimpleNavigation::Configuration.run do |navigation|


  navigation.items do |primary|

    primary.item :admin, 'HOME', '/home', :class => 'nav-border-left nav-border-top'
    primary.item :news, 'NEWS', '/admin/news_update', :class => 'nav-border-left nav-border-top'
    primary.item :bio, 'BIO', '/admin/bio_update', :class => 'nav-border-top'

    primary.dom_class = 'nav navbar-nav'

  end

end
