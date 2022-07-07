Dado('que o usuario consulte informações de fucncionario') do
   @get_list =  Projoao_requests.new
end
  
Quando('ele realizar a pesquisa') do
   @list_projoao = @get_list.find_projoao
end
  
Então('uma lista de funcionarios deve retornar') do
   expect(@list_projoao.code).to eql 200
   expect(@list_projoao.message).to eql 'OK'
end

Dado('que o usuario cadatre um novo funcionario') do
   @create = Projoao_requests.new
end
  
Quando('ele enviar as informações do funcionario') do
   @create_projoao = @create.create_projoao(@userId, @id, @title, @body)
   puts @create_projoao
end
  
Então('esse funcionario sera cadastrado') do
    expect(@create_projoao.code).to eql (201)
    expect(@create_projoao.msg).to eql 'Created'
    expect(@create_projoao.parsed_response["userId"]).to eql DATABASE[:userId][:userId1]
    expect(@create_projoao.parsed_response["id"]).to eql DATABASE[:id][:id1]
    expect(@create_projoao.parsed_response["title"]).to eql DATABASE[:title][:title2]
    expect(@create_projoao.parsed_response["body"]).to eql DATABASE[:body][:body2]
end

Dado('que o usuario altere uma informação de funcionario') do
   @update = Projoao_requests.new
end
  
Quando('ele enviar as novas informações') do
   @update_projoao = @update.update_projoao(@userId, @id, @title, @body)
   puts @update_projoao
end
  
Então('as informações serão alteradas') do
    expect(@update_projoao.code).to eql (200)
    expect(@update_projoao.msg).to eql 'OK'
    expect(@update_projoao.parsed_response["userId"]).to eql 1 #DATABASE[:userId][:userId1]
    expect(@update_projoao.parsed_response["id"]).to eql 10 #DATABASE[:id][:id1]
    expect(@update_projoao.parsed_response["title"]).to eql 'Teste Sandrinho10' #DATABASE[:title][:title2]
    expect(@update_projoao.parsed_response["body"]).to eql 'Body teste Sandro10' #DATABASE[:body][:body2]
end

Dado('que o usuario queira deletar um funcionario') do
   @delete = Projoao_requests.new
end
 
Quando('ele enviar a identificação unica') do
   @delete_projoao = @delete.delete_projoao(@id)
   puts @delete_projoao
end
 
Então('esse funcionario sera deletado do sistema') do
   expect(@delete_projoao.code).to eql (200)
   expect(@delete_projoao.msg).to eql 'OK'
   
end
