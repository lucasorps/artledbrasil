class ProdutoController < ApplicationController

 #before_action :autentificar, except: [:detalhar]

def secure? #? -> método boleano
    return false #Acesso permitido (Nâo há segurança)
  end


def detalhar

    @registro = Produto.find_by_id(params[:id])
    @desabilitar_pesquisa = true
  
end



def cadastro

  @produto = Produto.new

end 


def edicao

    @registro = Produto.find_by_id(params[:id])
    
    respond_to do |format|
      format.html { render :action => 'edicao' }
    end    
  
end


def atualizarproduto


@registro = Produto.find_by_id(params[:id])
@registro.update_attributes(produto_params)


redirect_to :controller => "produto", :action => "cadastro"
    
    #Update -> merge (trocar os dados do registro original 

   
    #respond_to do |format|
      
      #Modifica os dados do registro do banco baseado nos campos enviados pelo formulario
      #update cliente set nome=?, email=? where idcliente=?
      #if @registro.update_attributes(params[:produto])
        
        #flash[:notice] = 'Cliente atualizado com sucesso.'
        #format.html { redirect_to :action => 'consulta' }
            
      #else
        #flash[:notice] = 'Erro ao atualizar cliente.'
        #format.html { redirect_to :action => 'edicao' }    
      #end
       
    #end       
  end    


def excluir

     @registro = Produto.find_by_id(params[:id]).destroy
     

     redirect_to :controller => "produto", :action => "cadastro"

  
end





def cadastrarProduto

@produto = Produto.create(produto_params)

#@produto.codigo = Produto.gerarcodigoproduto(@produto.id).to_s

respond_to do |format|

  if @produto.valid?

    @produto.save
  
    flash[:notice] = 'Produto cadastrado com sucesso.'

  else

    #erros = ' '

    #if @produto.errors.any?
     # @produto.errors.messages.each do |message| 
      #   erros +=  message.last.last.html_safe.to_s + message.join("<br/>")
       #end 
    #end 

  flash[:notice] = @produto.errors.values.join("<br/>").html_safe
  

  end

  format.html { redirect_to :action => 'cadastro' }

end 
  
end


  private

  def produto_params
    params.require(:produto).permit(:nome,
   :categoria,
  :base,
:referencia,
 :tensao,   
 :potencia,
 :temperatura_cor,
 :dimensoes,
 :durabilidade,
 :fluxo_luminoso,
 :descricao, 
 :preco_unitario,
 :visivel,
 :destaque,
 :quantidade,
 :garantia,
 :imagem,
 :facho,
 :lente,
 :codigo
)
  end





end
