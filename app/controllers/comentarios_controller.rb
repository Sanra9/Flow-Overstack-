class ComentariosController < ApplicationController
  def create
    @comentario = Comentario.new(comentario_params)
    @comentario.user_id = current_user.id
    @comentario.save
    redirect_to question_path(params[:question_id])
  end
  def comentario_params
    params.require(:comentario).permit(:descripcion, :comentable_id, :comentable_type )
  end
end
