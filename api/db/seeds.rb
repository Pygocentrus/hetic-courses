# Run the following command to populate the database:
# rake db:seed

# Users
User.create([{
  role: "Admin",
  email: "hello@john.com",
  first_name: "John",
  last_name: "Doe",
  user_name: "Johnny",
  password: "hello",
  password_confirmation: "hello",
  city: "New York",
  birth_date: DateTime.new(1984, 11, 27),
  personal_link: "http://johndoe.com",
  batch: "P2009",
  avatar: "http://i.kinja-img.com/gawker-media/image/upload/s--gRG2YWja--/efg4piwisx1tcco4byit.png",
  short_bio: "Hello this is me, Grumpy Cat, Lord of the Internets.",
  slug: "johny"
},
{
  role: "Utilisateur",
  email: "paulgraham@gmail.com",
  first_name: "Paul",
  last_name: "Graham",
  user_name: "Paulo",
  password: "ycombinator",
  password_confirmation: "ycombinator",
  city: "San Francisco",
  birth_date: DateTime.new(1961, 5, 12),
  personal_link: "http://www.paulgraham.com",
  batch: "P2006",
  avatar: "http://ep.yimg.com/ca/I/paulgraham_2239_0",
  short_bio: "Paul Graham, YCombinator, founder.",
  slug: "paulo"
}])

# Categories
Categorie.create({ name: "Code" })
Categorie.create({ name: "Design" })
Categorie.create({ name: "Gestion de projet" })

# Tags
Tag.create({ name: "Git" })
Tag.create({ name: "NodeJS" })
Tag.create({ name: "PHP" })
Tag.create({ name: "Ruby" })
Tag.create({ name: "Ruby on Rails" })
Tag.create({ name: "Photoshop" })
Tag.create({ name: "Illustrator" })
Tag.create({ name: "Agile" })

# Courses
Course.create!([
  { title: "Ruby on Rails", description: "Id venenatis iaculis purus adipiscing consequat torquent vivamus egestas mi leo scelerisque imperdiet parturient viverra rhoncus a. Tincidunt at laoreet ullamcorper odio viverra condimentum in ut magna hendrerit penatibus id odio imperdiet etiam aliquam hendrerit gravida ac praesent ad. Nisl malesuada parturient sagittis sodales commodo parturient cras luctus nibh condimentum dui primis vestibulum urna justo scelerisque. Laoreet scelerisque sed consectetur pulvinar nostra dictumst ipsum sit tempor parturient sociosqu rhoncus praesent egestas placerat sed laoreet. Morbi suscipit et a consequat eget potenti adipiscing pharetra posuere eu ullamcorper nascetur nam et suscipit aenean consectetur mattis penatibus hendrerit. Consequat vestibulum justo ut vel ornare morbi a consectetur a vel tincidunt mi consequat diam arcu tempus quis parturient mus elementum vivamus vestibulum. Parturient lectus amet nascetur ullamcorper nulla id condimentum parturient parturient fames ac.", level: "Moyen", location: "Montreuil", video_link: "https://www.youtube.com/embed/PcR6BzeqsG0", slideshare_link: "http://fr.slideshare.net/peter_marklund/ruby-on-rails-101-presentation-slides-for-a-five-day-introductory-course", image_link: "http://upload.wikimedia.org/wikipedia/en/thumb/e/e9/Ruby_on_Rails.svg/791px-Ruby_on_Rails.svg.png", categorie_id: 1, user_id: nil, participation_id: nil, date: "2015-06-11 12:00:00", duration: "30", slug: "ruby-on-rails" },
  { title: "Photoshop débutant", description: "Amet ut dignissim vestibulum habitasse dis metus augue vestibulum interdum lacus nullam cras egestas himenaeos aenean dui venenatis parturie", level: "Facile", location: "Montreuil", video_link: "https://www.youtube.com/embed/do66w3JcI1U", slideshare_link: "http://fr.slideshare.net/marccdy1/basic-photoshop-tutorial", image_link: "http://3.bp.blogspot.com/-orTbW_XFbkI/T5J5j0LlONI/AAAAAAAAARI/W4HqIZ0iqSU/s1600/ps-cs6-logo-distorted-600.jpg", categorie_id: 2, user_id: nil, participation_id: nil, date: "2015-02-20 19:15:00", duration: "25", slug: "photoshop-debutant" },
  { title: "Git workflow", description: "Nam ad elit suspendisse nunc ultricies eu adipiscing ullamcorper mus cubilia curabitur felis a fermentum condimentum torquent risus suspendisse ante parturient scelerisque suspendisse mus justo donec scelerisque nec senectus.Ullamcorper phasellus a id id odio.", level: "Difficile", location: "Montreuil", video_link: "http://www.youtube.com/embed/gLWSJXBbJuE", slideshare_link: "http://fr.slideshare.net/pbhogan/power-your-workflow-with-git", image_link: "http://www.wakanda.org/sites/default/files/blog/blog-github.png", categorie_id: 1, user_id: nil, participation_id: nil, date: "2014-12-13 17:00:00", duration: "45", slug: "git-workflow" },
  { title: "NodeJS NPM", description: "Neque parturient convallis suscipit laoreet suspendisse a integer mus curabitur purus etiam vestibulum semper a dis mi quis nam suspendisse a leo curabitur.Justo nascetur a non scelerisque a a eu vestibulum justo vestibulum cras erat himenaeos vestibulum ullamcorper laoreet.", level: "Moyen", location: "Paris", video_link: "https://www.youtube.com/embed/ndKRjmA6WNA", slideshare_link: "http://fr.slideshare.net/vikasing/introduction-to-nodejs-11730771", image_link: "http://calebmadrigal.com/static/images/nodejs-logo.png", categorie_id: 1, user_id: nil, participation_id: nil, date: "2015-03-03 18:15:00", duration: "120", slug: "nodejs-npm" },
  { title: "UX Design", description: "Aliquet placerat scelerisque consectetur morbi mus aliquet vel eros lorem facilisis ridiculus netus fermentum nunc scelerisque per suspendisse urna litora pulvinar pulvinar netus donec aliquet tortor convallis semper.Ac ad scelerisque non quam placerat a a cursus scelerisque dis iaculis imperdiet inceptos risus nulla.", level: "Difficile", location: "Paris", video_link: "https://www.youtube.com/embed/ersZX3wrORE", slideshare_link: "http://fr.slideshare.net/sylvain/ux-design-service-design-design-thinking", image_link: "http://www.stateofdigital.com/wp-content/uploads/2014/03/UX-infographic.jpg", categorie_id: 2, user_id: nil, participation_id: nil, date: "2015-08-10 13:00:00", duration: "60", slug: "ux-design" },
  { title: "Git advanced", description: "Aliquet malesuada consequat condimentum condimentum curabitur arcu nulla purus a sem enim vestibulum dui lorem volutpat vulputate.Aliquet vel at ipsum est a consequat malesuada suspendisse laoreet aliquam sed scelerisque id dis praesent sagittis.Ultrices.", level: "Difficile", location: "Paris", video_link: "http://www.youtube.com/embed/Zo2vav3dYnY", slideshare_link: "http://fr.slideshare.net/pbhogan/power-your-workflow-with-git", image_link: "http://git-scm.com/images/logo@2x.png", categorie_id: 2, user_id: nil, participation_id: nil, date: "2015-01-12 18:30:00", duration: "120", slug: "git-advanced" },
  { title: "Agile et Scrum", description: "Adipiscing a adipiscing vitae sit a lacinia mus morbi risus purus dui natoque metus neque adipiscing libero torquent a.Montes ullamcorper interdum scelerisque ullamcorper scelerisque nisi euismod nec semper cras nec elit natoque scelerisque.", level: "Moyen", location: "Paris", video_link: "http://www.youtube.com/embed/XU0llRltyFM", slideshare_link: "http://fr.slideshare.net/trems/les-mthodes-agiles-introduction-presentation", image_link: "http://doug-shimp.net/wp-content/uploads/2009/05/scrum-terms-art-small.png", categorie_id: 3, user_id: nil, participation_id: nil, date: "2015-09-10 18:15:00", duration: "90", slug: "agile-et-scrum" },
  { title: "Bower, Grunt et Yeoman", description: "A a erat dui at orci donec natoque non parturient commodo lacinia lobortis in est mus magna amet vestibulum in enim condimentum elementum a parturient ullamcorper ad semper a. Duis urna nec ad a morbi torquent parturient adipiscing fringilla phasellus hac sociosqu quis parturient curae consectetur nascetur conubia hac a. A vestibulum inceptos a ut ultricies ridiculus cras morbi feugiat vestibulum a nibh vehicula velit condimentum lectus duis tellus facilisi hac luctus. Mi tristique.", level: "Moyen", location: "Montreuil", video_link: "https://www.youtube.com/embed/gKiaLSJW5xI", slideshare_link: "http://fr.slideshare.net/coppolariccardo/bower-grunt-a-practical-workflow", image_link: "http://gruntjs.com/img/grunt-logo-no-wordmark.svg", categorie_id: 1, user_id: nil, participation_id: nil, date: "2015-02-14 18:00:00", duration: "90", slug: "bower-grunt-et-yeoman" }
])

# Participations
Participation.create!([
  { course_id: 1, user_id: 1, date: nil, role: "author" },
  { course_id: 1, user_id: 2, date: nil, role: "participant" },
  { course_id: 2, user_id: 2, date: nil, role: "author" },
  { course_id: 2, user_id: 1, date: nil, role: "participant" },
  { course_id: 3, user_id: 1, date: nil, role: "author" },
  { course_id: 4, user_id: 1, date: nil, role: "author" },
  { course_id: 4, user_id: 2, date: nil, role: "participant" },
  { course_id: 5, user_id: 2, date: nil, role: "author" },
  { course_id: 5, user_id: 1, date: nil, role: "participant" },
  { course_id: 6, user_id: 2, date: nil, role: "author" },
  { course_id: 7, user_id: 2, date: nil, role: "author" },
  { course_id: 7, user_id: 1, date: nil, role: "participant" },
  { course_id: 8, user_id: 1, date: nil, role: "author" }
])

# Taggings
Tagging.create!([
  { tag_id: 1, course_id: 3 },
  { tag_id: 1, course_id: 6 },
  { tag_id: 2, course_id: 4 },
  { tag_id: 4, course_id: 1 },
  { tag_id: 5, course_id: 1 },
  { tag_id: 6, course_id: 2 },
  { tag_id: 6, course_id: 5 },
  { tag_id: 7, course_id: 5 },
  { tag_id: 8, course_id: 7 },
  { tag_id: 2, course_id: 8 }
])
