# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

settings = Settings.create([{
#                                 bio1:
#
#                                     'Jessica Sarah spent much of her childhood in Australia training and
# competing as a gymnast.
# It wasn\'t until she turned sixteen that Jessica picked up her dad\'s guitar for the first time.
# After spending a few months learning to play,
# she began writing songs and fell in love with the idea of creating and singing her own original music.
# Dreaming was one of the first songs that Jessica self-penned acoustically, before going on to write and
# record material for her debut EP Wooden Seas.',
#
#                                 bio2:
#                                     'In early 2013 Jessica was heard rehearsing for an open mic session at the famous Aussie event,
# Woodford Folk Festival, by Darren Percival from The Voice. As he walked past, Darren stopped in his tracks and
# invited Jessica to play with him at the Pineapple lounge in front of her first packed house.
# <br><br>
# Jessica recorded the six original songs for Wooden Seas in the first half of 2013. The release received the attention of
# Australian Broadcasting Corporation ABC station Triple J and after air play, she was interviewed by announcer Rosie Beaton.
# Jessica was offered the honour to have her songs placed in the ABC library, available for the use of secondary school students in their film projects.
# A few months later Jessica was recognised for her talents after entering the national First Break competition and was awarded a place in the top thirty.￼
# <br><br>
# Now just finished high school,
# this talented singer and songwriter has been fielding offers from internationally signed acts to write lyrics and melodies for their songs.
# Jessica\'s creativity and love for song writing has made her determined to pursue a career in the music industry.',

                                facebook_post:
                                    '<div id="fb-root"></div>
        <script>(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, \' script \', \' facebook-jssdk \'));</script>
        <div class="fb-post" data-href="https://www.facebook.com/jessicasarahmusic/photos/a.314869541948504.55607.304789669623158/524634494305340/?type=1" data-width="350">
          <div class="fb-xfbml-parse-ignore">
            <a href="https://www.facebook.com/jessicasarahmusic/photos/a.314869541948504.55607.304789669623158/524634494305340/?type=1">Post</a>
            by <a href="https://www.facebook.com/jessicasarahmusic">Jessica Sarah</a>.
          </div>
        </div>'
}])

