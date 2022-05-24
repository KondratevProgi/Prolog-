require "yaml"





# Задание 1
class Department #имя отдела, номер тел, список обяз, список постов
    include Comparable 
    public attr_accessor :name
    public attr_reader :number
    def initialize(name,number,duties=[],post_list=Post_list.new())
        self.name= name
        self.number= number
        @duties=duties
        @duties_index_now=0
        @post_list=post_list if Post_list.is_Post?(post_list)
    end
    def number=(val)
      @number=val if Department.number?(val)
    end
    def duties_empty?()
      @duties.size==0
    end
    def to_s()
      return "название:#{self.name}  номер телефона:#{self.number}  обязанности:#{self.duties_read}"
    end
    def duties_add(dutie)
      @duties.push(dutie).uniq!()
    end
    def duties_read()
      sum=","
      @duties.each_with_index do |x,ind| 
        if(ind==@duties_index_now)
          sum+="[#{x}],"
        else
          sum+="#{x},"
        end
      end
      return sum
    end
    def duties_cursor(dutie) #управлять элем департ
      @duties_index_now = @duties.find_index(dutie) if @duties.find_index(dutie)!= nil
    end
    def duties_cursor_read()
      return @duties[duties_index_now].to_s if  !(self.duties_empty?) 
    end
    def duties_cursor_update(dutie)
      @duties[@duties_index_now]= dutie if !((@duties.include?(dutie)) & (self.duties_empty?))
    end
    def duties_cursor_delete()
      @duties.delete_at(@duties_index_now) if !(self.duties_empty?) 
      @duties_index_now=0
    end
    def Department.number?(number)
      return /\+[0-9]{11}/.match?(number)
    end
    def duties_size()
      @duties.size()
    end
    def <=>(val)
      return 0 if self.name== val.name || self.number== val.number
      return 1 if self.duties_size() > val.duties_size()
      return -1
    end
    def as_hash 
      {
        "name"=> self.name,
        "number"=> self.number,
        "duties"=> @duties,
        "posts"=>@post_list.mass_hash
      }
    end
    def to_s_full()
      self.to_s()+" "+@post_list.to_s()
    end
    def post_cursor=(val)
      @post_list.post_cursor=(val)
    end
    def post_cursor()
      @post_list.post_cursor
    end
    def post_add(val)
      @post_list.post_add(val)
    end
    def post_cursor_update(val)
      @post_list.post_cursor_update(val)
    end
    def post_cursor_delete()
      @post_list.post_cursor_delete()
    end
    def post_read()
      @post_list.post_read()
    end
    def post_free()
      @post_list.select{|x| x.isfree == false}
    end

end







