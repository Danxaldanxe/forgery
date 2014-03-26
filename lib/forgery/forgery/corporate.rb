class Forgery::Corporate < Forgery

  DEPARTMENTS = Forgery::Extend([
    {:type => 'Business', :dict => :jobs_business },
    {:type => 'Information Technology', :dict => :jobs_it },
    {:type => 'Security', :dict => :jobs_security },
    {:type => 'Accounting', :dict => :jobs_accounting },
    {:type => 'Sales', :dict => :jobs_sales },
    {:type => 'Human Resources', :dict => :jobs_hr },
    {:type => 'Operations', :dict => :jobs_hr }
  ])

  def self.department
    DEPARTMENTS.random[:type]
  end

  def self.job_title(options={})
    department = if options[:type]
      DEPARTMENTS.find { |dept| dept[:type] == options[:type] }.clone
    else
      DEPARTMENTS.random.clone
    end
    
    dictionaries[department[:dict]].random.sub('#{N}', self.job_title_suffix).unextend
  end  
    
  def self.job_title_suffix
    dictionaries[:job_title_suffixes].random.unextend
  end
end
