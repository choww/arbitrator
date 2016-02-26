#For populating test data for db

############
#Test Users#
############
user_a = User.create(username: "CrashOverride", email: "jlm@elementary.com", password: "angie")
user_b = User.create(username: "ZeroCool", email: "jlm@trainspotting.com", password: "sickboy")
user_c = User.create(username: "CerealKiller", email: "ml@scoobysnacks.com", password: "scream")
user_d = User.create(username: "AcidBurn", email: "lara@tombs.com", password: "brad")
user_e = User.create(username: "LordNikon", email: "sammy@prisonbreak.com", password: "sammy")
user_f = User.create(username: "PhantomPhreak", email: "sallycantdance@conair.com", password: "ramon")
user_g = User.create(username: "Plague", email: "fisher@shortcircuit.com", password: "johnny5")

################
#Test Questions#
################
q_a = user_a.questions.create(category: "sports", content: "Pippen v. Jordan", time: 60, option_a: "Pippen", option_b: "Jordan")


############
#Test Votes#
############
#No user_a
v_a = user_b.votes.create(value: 1, question_id: q_a.id)
v_b = user_c.votes.create(value: 0, question_id: q_a.id)
