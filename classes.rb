require 'telegram/bot'
    class Criticblunder
      @@critic = [[nil, nil, 4],[nil, nil, 6], [nil, nil, 8], [nil, nil, 8], [20, 20, 20], [1, 5, 100]]
      @@blunder = [[nil, nil, 4],[nil, nil, 6], [nil, nil, 8], [nil, nil, 8], [1, 1, 20], [95, 100, 100]]
      def cr_bl_assign(dice_type_index, dice_string, values, type_of_assign)
        assigner_1 = nil
        assigner_2 = nil
        assigner_text_1 = nil
        assigner_text_2 = nil
        if type_of_assign == 'critic'
          assigner_1 = @@critic
          assigner_2 = @@blunder
          assigner_text_1 = 'critic'
          assigner_text_2 = 'blunder'
        end
        if type_of_assign == 'blunder'
          assigner_1 = @@blunder
          assigner_2 = @@critic
          assigner_text_1 = 'blunder'
          assigner_text_2 = 'critic'
        end
        if values == 'none'
          assigner_1[dice_type_index][0] = nil
          assigner_1[dice_type_index][1] = nil
          return "#{assigner_text_1.capitalize} value setted to none"
        end
        new_values = values.split('to')
        return 'You can only assign a maximum of two values' if new_values.length > 2
        unless assigner_2[dice_type_index][0].nil?
          new_values.length.times do |i|
            if new_values[i].to_i.between?(assigner_2[dice_type_index][0], assigner_2[dice_type_index][1])
              return "#{assigner_text_2.capitalize} value is #{assigner_2[dice_type_index][0]}. You can't assign #{new_values[i].to_i} to #{assigner_text_1}" if assigner_2[dice_type_index][0] == assigner_2[dice_type_index][1]
              return "#{assigner_text_2.capitalize} range goes from #{assigner_2[dice_type_index][0]} to #{assigner_2[dice_type_index][1]}. You can't assign #{new_values[i].to_i} to #{assigner_text_1}"
            end
          end
        end
        assigner_1[dice_type_index][0] = new_values[0].to_i if new_values[0].to_i.between?(1, assigner_1[dice_type_index][2])
        assigner_1[dice_type_index][1] =  assigner_1[dice_type_index][0] if new_values.length == 1
        assigner_1[dice_type_index][1] = new_values[1].to_i if new_values.length > 1 and new_values[1].to_i.between?(1, assigner_1[dice_type_index][2])
        assigner_1[dice_type_index][1] = nil if assigner_1[dice_type_index][0] == nil
        return "Your #{assigner_text_1} roll must be within a range from 1 to #{assigner_1[dice_type_index][2]}" if assigner_1[dice_type_index][0].nil?
        assigner_1[dice_type_index][0], assigner_1[dice_type_index][1] = assigner_1[dice_type_index][1], assigner_1[dice_type_index][0] if assigner_1[dice_type_index][0] > assigner_1[dice_type_index][1]
        return "The new value for #{dice_string} #{assigner_text_1} is now #{assigner_1[dice_type_index][0]}" if assigner_1[dice_type_index][0] == assigner_1[dice_type_index][1]
        return "The new #{assigner_text_1} range for #{dice_string} goes from #{assigner_1[dice_type_index][0]} to #{assigner_1[dice_type_index][1]}"
      end

      def cr_bl_status(dice_type_index, dice_string, type_of_assign)
        assigner = @@critic if type_of_assign == 'critic'
        assigner = @@blunder if type_of_assign == 'blunder'
        return "There is no range or value assigned for #{dice_string} #{type_of_assign} roll" if assigner[dice_type_index][0].nil?
        return "The value for #{dice_string} #{type_of_assign} is #{assigner[dice_type_index][0]}" if assigner[dice_type_index][0] == assigner[dice_type_index][1]
        return "The #{type_of_assign} range for #{dice_string} goes from #{assigner[dice_type_index][0]} to #{assigner[dice_type_index][1]}"
      end

      def cr_bl_roll(dice_type_index, roll)
        return " CRITIC ROLL!" if @@critic[dice_type_index][0] != nil and roll.between?(@@critic[dice_type_index][0], @@critic[dice_type_index][1])
        return " BLUNDER" if @@blunder[dice_type_index][0] != nil and roll.between?(@@blunder[dice_type_index][0], @@blunder[dice_type_index][1])
      end
    end

    class Calcs
      def operation(operator, roll, number, comparison = nil, compare_to = nil)
        case operator
        when '+'
          operation = roll + number
          if comparison == 'bgt' and operation > compare_to
            return "#{operation} is bigger than #{compare_to}. Succes!"
          elsif comparison =='bgt' and operation < compare_to
            return "#{operation} is smaller than #{compare_to}. Failure"
          end
          if comparison == 'smt' and operation < compare_to
            return "#{operation} is smaller than #{compare_to}. Succes!"
          elsif comparison == 'smt' and operation > compare_to
            return "#{operation} is bigger than #{compare_to}. Failure"
          end
          operation
        when '-'
          operation = roll - number
          if comparison == 'bgt' and operation > compare_to
            return "#{operation} is bigger than #{compare_to}. Succes!"
          elsif comparison =='bgt' and operation < compare_to
            return "#{operation} is smaller than #{compare_to}. Failure"
          end
          if comparison == 'smt' and operation < compare_to
            return "#{operation} is smaller than #{compare_to}. Succes!"
          elsif comparison == 'smt' and operation > compare_to
            return "#{operation} is bigger than #{compare_to}. Failure"
          end
          operation
        when '*'
          operation = roll * number
          if comparison == 'bgt' and operation > compare_to
            return "#{operation} is bigger than #{compare_to}. Succes!"
          elsif comparison =='bgt' and operation < compare_to
            return "#{operation} is smaller than #{compare_to}. Failure"
          end
          if comparison == 'smt' and operation < compare_to
            return "#{operation} is smaller than #{compare_to}. Succes!"
          elsif comparison == 'smt' and operation > compare_to
            return "#{operation} is bigger than #{compare_to}. Failure"
          end
          operation
        when '/'
          operation = roll.to_f / number.to_f
          if comparison == 'bgt' and operation > compare_to
            return "#{operation} is bigger than #{compare_to}. Succes!"
          elsif comparison =='bgt' and operation < compare_to
            return "#{operation} is smaller than #{compare_to}. Failure"
          end
          if comparison == 'smt' and operation < compare_to
            return "#{operation} is smaller than #{compare_to}. Succes!"
          elsif comparison == 'smt' and operation > compare_to
            return "#{operation} is bigger than #{compare_to}. Failure"
          end
          operation
        end
      end
    end
