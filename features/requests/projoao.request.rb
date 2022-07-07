class Projoao_requests
    
    def find_projoao
       PROjoao.get('/?userId=1')
    end

   def create_projoao(userId, id, title, body)
    PROjoao.post('/posts', body: {
         "userId": DATABASE[:userId][:userId1],
         "id": DATABASE[:id][:id1],
         "title": DATABASE[:title][:title2],
         "body": DATABASE[:body][:body2]
    }.to_json)
    end

    def update_projoao(userId, id, title, body)
        id = DATABASE[:id][:id5]
        PROjoao.put('/posts/' + id.to_s , body: {
        "userId": 1, #DATABASE[:userId][:userId2],
        "id": 101,
        "title": "Teste Sandrinho10", #DATABASE[:title][:title2],
        "body": "Body teste Sandro10" #DATABASE[:body][:body2]
       }.to_json)
    end

    def delete_projoao(id)
        PROjoao.delete('/posts/1')
    end
    
end