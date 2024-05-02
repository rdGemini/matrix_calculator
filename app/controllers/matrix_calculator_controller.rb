class MatrixCalculatorController < ApplicationController
  def index
    @result_matrix = ""
  end

    def show
        @result_matrix = params[:result]
      end
  
    def create
        @object = Object.new(object_params)
      
        if @object.save
          redirect_to @object, notice: 'Object was successfully created.'
        else
          render :new
        end
      end

      def multiply
        puts "Parameters: #{params.inspect}"
        rows_a = params.dig(:matrix_a, :rows).to_i
        columns_a = params.dig(:matrix_a, :columns).to_i
        matrix_a = Array.new(rows_a) { |i| Array.new(columns_a) { |j| params.dig(:matrix_a, i.to_s, j.to_s).to_i } }
      
        rows_b = params.dig(:matrix_b, :rows).to_i
        columns_b = params.dig(:matrix_b, :columns).to_i
        matrix_b = Array.new(rows_b) { |i| Array.new(columns_b) { |j| params.dig(:matrix_b, i.to_s, j.to_s).to_i } }
      
        # Check if matrices can be multiplied
        if columns_a != rows_b
          @result_matrix = "Error: The number of columns in Matrix A must be equal to the number of rows in Matrix B for multiplication."
          render :show
          return
        end
      
        # Debug: Print the matrices
        puts "Matrix A:"
        matrix_a.each { |row| puts row.inspect }
      
        puts "Matrix B:"
        matrix_b.each { |row| puts row.inspect }
      
        # Perform matrix multiplication
        result = Array.new(rows_a) { Array.new(columns_b, 0) }
        (0...rows_a).each do |i|
          (0...columns_b).each do |j|
            (0...columns_a).each do |k|
              result[i][j] += matrix_a[i][k] * matrix_b[k][j]
            end
          end
        end
      
        # Debug: Print the result matrix
        puts "Result Matrix:"
        result.each { |row| puts row.inspect }
      
        # Format the result for display
        @result_matrix = result.map { |row| row.join(', ') }.join('; ')
        #render :show

        respond_to do |format|
          format.html { render :show }
          format.js { render 'show.js.erb' }
        end
      end
  end
