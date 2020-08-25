class UsuarioController < ApplicationController

before_action :verificaracesso, except: [:cadastrarusuario, :cadastro, :edicao, :atualizarusuario, :alterarsenha, :alteracaoperfil, :alterarperfilacesso,
  :retornalistausuarios]

def alteracaoperfil
  
  @usuario = Usuario.new
  @usuarios = Usuario.where("perfil = ?", "ADM").select(:id, :nome)
  
end

def retornalistausuarios
  
  @usuarios = Usuario.where("perfil = ?",  params[:perfil]).select(:id, :nome)
  
  render :text => (view_context.select_tag 'usuario', view_context.options_from_collection_for_select(@usuarios, 'id', 'nome'), multiple: true, id: 'usuario')
end


def alterarperfilacesso
  
  @perfil_usuario = Usuario.find_by_id(params[:usuario])
  
  @perfil_usuario.update_attribute(:perfil, params[:novo_perfil])
  
  redirect_to controller: "usuario", action: "alteracaoperfil" 
    
  
end



def cadastrarusuario

@usuario = Usuario.create( usuario_params)
@usuario.perfil = 'CLI'

respond_to do |format|

  

  if @usuario.valid?

  @usuario.save
  flash[:notice] = 'Usuario cadastrado com sucesso.'
  
  
  format.html { redirect_to :controller => "login", :action => "login" }

  else
  
  #erros = ' '
  #if @usuario.errors.any?
   # @usuario.errors.messages.each do |message| 
    #   erros +=  message.last.last.html_safe.to_s + errors.values.join("<br/>").html_safe 
     #end 
   #end 

  erros = @usuario.errors.values
  erros.reject{ |e| erros.count(e) > 1 }
  er = erros.detect{ |e| erros.count(e) == 1 }


  flash[:notice] = er.join("<br/>").html_safe
#@usuario.errors.values.join("<br/>").html_safe
  

  format.html { redirect_to :action => 'cadastro' } 
  end
  
  

end 
  
end

def cadastro

  @usuario = Usuario.new
  @desabilitar_pesquisa = true
  
end 



def edicao

    @registro = Usuario.find_by_id(params[:id])
    
    respond_to do |format|
      format.html { render :action => 'edicao' }
    end    
  
end


def atualizarusuario

@registro = Usuario.find_by_id(params[:id])

@registro.update_attributes(usuario_params)
  

redirect_to :controller => "usuario", :action => "edicao", :id => @registro.id 
  
  
        
end    



  def alterarsenha
    
    
    @registro = Usuario.find_by_id(params[:id])

    
    senhaantiga = params[:senhaantiga]
    
    novasenha = params[:novasenha]
    
    novasenharepetir = params[:novasenharepertir]    
    
     if senhaantiga != @registro.senha
       
        
        
          flash[:notice] = 'Senha informada nao corresponde com a senha registrada.'
          
            
       

     else
      if novasenha != novasenharepetir
      flash[:notice] = 'As duas senhas informadas nos campos nao sao correspondentes'
      
      else   
        @registro.update_attribute('senha', novasenha)
        flash[:notice] = 'Senha alterada com sucesso!'
   end 
  end
  
 redirect_to :controller => "usuario", :action => "edicao", :id => @registro.id 
         
    
  end




private

  def usuario_params
    params.require(:usuario).permit(:nome,
 
:sexo,
:rg,
:cpf,
:cep,
:logradouro,
:numero,
:municipio,
:complemento,
:uf,
:telefone_residencial,
:telefone_celular,
:email,
:senha
)
  end







end