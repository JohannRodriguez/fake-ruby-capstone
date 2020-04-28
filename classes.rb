require 'telegram/bot'
    class Criticblunder
      @@critic = [[nil, nil, 4],[nil, nil, 6], [nil, nil, 8], [nil, nil, 8], [20, 20, 20], [1, 5, 100]]
      @@blunder = [[nil, nil, 4],[nil, nil, 6], [nil, nil, 8], [nil, nil, 8], [1, 1, 20], [95, 100, 100]]
      @@dice_index_array =[[4, 0],[6, 1],[8, 2],[10, 3],[20, 4],[100, 5]]
      @@valid_dice = [4, 6, 8, 10, 20, 100]
      def cr_bl_assign(dice_type, values, type_of_assign)
        dice_type_index = dice_index(dice_type)
        assigner_1 = nil
        assigner_2 = nil
        assigner_text_1 = nil
        assigner_text_2 = nil
        if type_of_assign == 'cr'
          assigner_1 = @@critic
          assigner_2 = @@blunder
          assigner_text_1 = 'critic'
          assigner_text_2 = 'blunder'
        end
        if type_of_assign == 'bl'
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
        return "Your #{assigner_text_1} roll must be within a range from 1 to #{assigner_1[dice_type_index][2]}" unless new_values[0].to_i.between?(1, assigner_1[dice_type_index][2]) and new_values[1].to_i.between?(1, assigner_1[dice_type_index][2])
        assigner_1[dice_type_index][0], assigner_1[dice_type_index][1] = assigner_1[dice_type_index][1], assigner_1[dice_type_index][0] if assigner_1[dice_type_index][0] > assigner_1[dice_type_index][1]
        return "The new value for D#{dice_type} #{assigner_text_1} is now #{assigner_1[dice_type_index][0]}" if assigner_1[dice_type_index][0] == assigner_1[dice_type_index][1]
        return "The new #{assigner_text_1} range for D#{dice_type} goes from #{assigner_1[dice_type_index][0]} to #{assigner_1[dice_type_index][1]}"
      end

      def cr_bl_status(dice_type, type_of_assign)
        dice_type_index = dice_index(dice_type)
        assigner = @@critic if type_of_assign == 'cr'
        assigner = @@blunder if type_of_assign == 'bl'
        type_of_assign_text = 'critic' if type_of_assign == 'cr'
        type_of_assign_text = 'blunder' if type_of_assign == 'bl'
        return "There is no range or value assigned for #{dice_type} #{type_of_assign_text} roll" if assigner[dice_type_index][0].nil?
        return "The value for #{dice_type} #{type_of_assign_text} is #{assigner[dice_type_index][0]}" if assigner[dice_type_index][0] == assigner[dice_type_index][1]
        return "The #{type_of_assign_text} range for #{dice_type} goes from #{assigner[dice_type_index][0]} to #{assigner[dice_type_index][1]}"
      end

      def cr_bl_roll(dice_type, roll)
        dice_type_index = dice_index(dice_type)
        return " CRITIC ROLL!" if @@critic[dice_type_index][0] != nil and roll.between?(@@critic[dice_type_index][0], @@critic[dice_type_index][1])
        return " BLUNDER" if @@blunder[dice_type_index][0] != nil and roll.between?(@@blunder[dice_type_index][0], @@blunder[dice_type_index][1])
      end

      def new_cr_bl(dice)
        @@critic.push([nil, nil, dice])
        @@blunder.push([nil, nil, dice])
        dice_index(nil, dice)
      end

      def dice_index(dice_type, new_dice = nil)
        if new_dice.is_a?(Integer)
           @@dice_index_array.push([new_dice, @@dice_index_array.length])
           accepted_dices(nil, new_dice)
           return "Dice succesfully added, you can use it as the rest os the dices using /rd#{new_dice} to make a simple roll or /d#{new_dice} with any variation to add diferent cualities to the roll"
        end
        @@dice_index_array.length.times { |i| return @@dice_index_array[i][1] if @@dice_index_array[i][0] == dice_type } unless dice_type.nil?
      end

      def accepted_dices(dice, new_dice = nil)
        if new_dice.is_a?(Integer)
          @@valid_dice.push(new_dice)
          return
        end
        return true if @@valid_dice.include?(dice) and dice != nil
        return false if dice != nil
      end
    end

    class Calcs
      def operation(roll, operation_value, operator)
        case operator
        when 'add'
          return roll + operation_value
        when 'sub'
          return roll - operation_value
        when 'mult'
          return roll * operation_value
        when 'div'
          return roll / operation_value
        end
      end

      def compare(roll, comparison, comparer)
        if comparer == 'smt'
          return 'Succes!' if roll < comparison
          return 'Failure' if roll >= comparison
        end
        if comparer == 'bgt'
          return 'Succes!' if roll > comparison
          return 'Failure' if roll <= comparison
        end
      end
    end

    class Rolls
      @@crbl = Criticblunder.new
      @@calc = Calcs.new
      def single_roll(dice_value)
        roll = rand(1..dice_value)
        return "D#{dice_value} rolled, your roll is: \n #{roll}#{@@crbl.cr_bl_roll(dice_value, roll)}"
      end

      def multiple_rolls(dice_value, dices)
        rolls_array = ["D#{dice_value} #{dices} rolled, results:"]
        dices.times do
          roll = rand(1..dice_value)
          rolls_array.push("\n #{roll}#{@@crbl.cr_bl_roll(dice_value, roll)}")
        end
        rolls_array.join
      end

      def compare_roll(dice_value, comparison, comparer, multiple = nil)
        assign = assigners(comparer)
        comparer_text = assign[0]
        roll = rand(1..dice_value)
        if multiple.is_a?(Integer)
          rolls_comparison_array = ["D#{dice_value} #{comparer_text} than #{comparison}, results:"]
          multiple.times do
            roll = rand(1..dice_value)
            rolls_comparison_array.push("\n #{roll}#{@@crbl.cr_bl_roll(dice_value, roll)}, #{@@calc.compare(roll, comparison, comparer)}" )
          end
          return rolls_comparison_array.join
        end
        return "D#{dice_value} #{comparer_text} than #{comparison}, your roll is: \n #{roll}#{@@crbl.cr_bl_roll(dice_value, roll)}, #{@@calc.compare(roll, comparison, comparer)}"
      end

      def compare_roll_with_math(dice_value, comparison, comparer, operation_value, operator, multiple = nil)
        assign = assigners(comparer, operator)
        comparer_text = assign[0]
        operator_text = assign[1]
        operator_symbol = assign[2]
        roll = rand(1..dice_value)
        if multiple.is_a?(Integer)
          rolls_comparison_array = ["#{multiple} times D#{dice_value} #{operator_text} #{operation_value} #{comparer_text} than #{comparison}, your results are:"]
          multiple.times do
            roll = rand(1..dice_value)
            rolls_comparison_array.push(" \n #{roll}#{@@crbl.cr_bl_roll(dice_value, roll)}  #{operator_symbol} #{operation_value} = #{@@calc.operation(roll, operation_value, operator)}, #{@@calc.compare(@@calc.operation(roll, operation_value, operator), comparison, comparer)}")
          end
          return rolls_comparison_array.join
        end
        return "D#{dice_value} #{operator_text} #{operation_value} #{comparer_text} than #{comparison} your result is: \n #{roll}#{@@crbl.cr_bl_roll(dice_value, roll)}  #{operator_symbol} #{operation_value} = #{@@calc.operation(roll, operation_value, operator)}, #{@@calc.compare(@@calc.operation(roll, operation_value, operator), comparison, comparer)}"
      end

      def roll_with_operation(dice_value, operation_value, operator, multiple = nil)
        assign = assigners(nil, operator)
        operator_text = assign[1]
        operator_symbol = assign[2]
        roll = rand(1..dice_value)
        if multiple.is_a?(Integer)
          multiple_operator_array = [" #{multiple} times D#{dice_value} #{operator_text} #{operation_value}, your results are:"]
          multiple.times do
            roll = rand(1..dice_value)
            multiple_operator_array.push(" \n #{roll}#{@@crbl.cr_bl_roll(dice_value, roll)} #{operator_symbol} #{operation_value} = #{@@calc.operation(roll, operation_value, operator)}")
          end
          return multiple_operator_array.join
        end
        return "D#{dice_value} #{operator_text} #{operation_value}, your result is: \n #{roll}#{@@crbl.cr_bl_roll(dice_value, roll)} #{operator_symbol} #{operation_value} = #{@@calc.operation(roll, operation_value, operator)}"
      end

      def assigners(cm_txt = nil, op = nil)
        case cm_txt
        when 'smt'
          cm_txt_asg = 'smaller'
        when 'bgt'
          cm_txt_asg = 'bigger'
        end
        case op
        when 'add'
          op_txt_asg = 'plus' if op == 'add'
          op_sym_asg = '+' if op == 'add'
        when 'sub'
          op_txt_asg = 'minus' if op == 'sub'
          op_sym_asg = '-' if op == 'sub'
        when 'mult'
          op_txt_asg = 'times' if op == 'mult'
          op_sym_asg = '*' if op == 'mult'
        when 'div'
          op_txt_asg = 'divided by' if op == 'div'
          op_sym_asg = '/' if op == 'div'
        end
        return [cm_txt_asg, op_txt_asg, op_sym_asg]
      end
    end
