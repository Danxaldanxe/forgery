class Forgery::Corporate < Forgery

  DEPARTMENTS = Forgery::Extend([
    {type: 'Business', dict: :jobs_business },
    {type: 'Engineering', dict: :jobs_engineering },
    {type: 'Information Technology', dict: :jobs_it },
    {type: 'Accounting', dict: :jobs_accounting },
    {type: 'Human Resources', dict: :jobs_hr },
    {type: 'Medical', dict: :jobs_medical}
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
