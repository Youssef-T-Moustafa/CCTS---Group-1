
# Activities
#Activity.destroy(activity_name: "Club E")


(1..10).each do |i|
    Post.create(title: "Title #{i}",
        created_at: Time.now - i.days,
        updated_at: Time.now - i.days,
        views: rand(15..50))
end