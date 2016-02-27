#For populating test data for db

############
#Test Users#
############
user_a = User.create(username: "CrashOverride", email: "jlm@elementary.com", password: "angie")
user_b = User.create(username: "ZeroCool", email: "jlm@trainspotting.com", password: "sickboy")
user_c = User.create(username: "CerealKiller", email: "ml@scoobysnacks.com", password: "scream")

################
#Test Questions#
################
q_a = user_a.questions.create(category: "sports", tagged_user: "", content: "Pippen v. Jordan", time: 60, option_a: "Pippen", option_b: "Jordan")


############
#Test Votes#
############
#No user_a
v_a = user_b.votes.create(value: 1, question_id: q_a.id)
v_b = user_c.votes.create(value: 0, question_id: q_a.id)
