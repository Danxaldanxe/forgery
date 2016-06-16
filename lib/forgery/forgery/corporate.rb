class Forgery::Corporate < Forgery

  DEPARTMENTS = Forgery::Extend([
    {type: 'Business', type: :jobs_business },
    {type: 'Engineering', type: :jobs_engineering },
    {type: 'Information Technology', type: :jobs_it },
    {type: 'Accounting', type: :jobs_accounting },
    {type: 'Human Resources', dict: :jobs_hr },
    {type: 'Medical', type: :jobs_medical}
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
