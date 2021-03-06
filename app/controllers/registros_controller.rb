class RegistrosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy]
 
  # GET /registros
  # GET /registros.json
  def index
    @registros = Registro.all  # paginate(page: params[:page], per_page: 5) # unless request.format == 'xls'
    
    respond_to do |format|
      format.html
      format.csv { send_data text: @registros.to_csv }
      # For excel exporting
      format.xls # { send_data @registros.to_csv(col_sep: "\t") }
    end
  end

  # GET /registros/1
  # GET /registros/1.json
  def show
  end

  # GET /registros/new
  def new
    @registro = Registro.new
  end

  # GET /registros/1/edit
  def edit
  end

  # POST /registros
  # POST /registros.json
  def create
    @registro = Registro.new(registro_params)
    @registro.user = current_user

    respond_to do |format|
      if @registro.save
        format.html { redirect_to @registro, notice: 'Registro was successfully created.' }
        format.json { render :show, status: :created, location: @registro }
      else
        format.html { render :new }
        format.json { render json: @registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registros/1
  # PATCH/PUT /registros/1.json
  def update
    respond_to do |format|
      if @registro.update(registro_params)
        format.html { redirect_to @registro, notice: 'Registro was successfully updated.' }
        format.json { render :show, status: :ok, location: @registro }
      else
        format.html { render :edit }
        format.json { render json: @registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registros/1
  # DELETE /registros/1.json
  def destroy
    @registro.destroy
    respond_to do |format|
      format.html { redirect_to registros_url, notice: 'Registro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registro
      @registro = Registro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registro_params
      params.require(:registro).permit(:nombre, :apellido, :puesto, :materia, :centro, :pueblo, :nivel, :sec, :email, :telefono, :comentario, :user_id)
    end
end
