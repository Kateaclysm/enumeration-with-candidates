# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each do |candidate|
    return candidate if candidate[:id] == id
  end
end
  #=> Test call:
find(5)

#=> HELPER METHODS: 
  def experienced?(candidate)
    candidate[:years_of_experience] >= 2
  end
  
  def github_points_over_100?(candidate)  #=> Checks if the candidate has 100 or more points on github.
    candidate[:github_points] >= 100
  end
  
  def known_lang(candidate) #=> Checks if candidate knows Ruby OR Python.
    candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
  end
  
  def application_time(candidate) #=> Checks the candidate's application date.
    candidate[:date_applied] >= Date.today - 15
  end
  
  def candidate_age(candidate) #=> Checks age of candidate.
    candidate[:age] >= 18
  end
#=> END HELPER METHODS --------------------------

  def qualified_candidates(candidates)
    candidates.select do |candidate|
      experienced?(candidate) &&
      github_points_over_100?(candidate) &&
      known_lang(candidate) &&
      application_time(candidate) &&
      candidate_age(candidate)
    end
  end

    #=> Test call: 
    result = qualified_candidates(@candidates)
    puts "Here is the result of the test call for the Qualified Candidates method: #{result}"

  # More methods will go below
  
  def ordered_by_qualifications(candidates)
    candidates.sort_by do |candidate|
      [-candidate[:years_of_experience], -candidate[:github_points]]
    end
  end
  #=> Test call:
  ordered_candidates = ordered_by_qualifications(@candidates)
  puts "Here is the return of the 'ordered_by_qualifications' method: #{ordered_candidates}"