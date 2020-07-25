# dwu_project

A new Flutter project.

# objetivo

Criar um aplicativo em flutter para cadastro de colaborador com duas telas, uma de login e outra de cadastros.

Para a tela de login, deve ser feito um campo de usuário e outro de senha e um botão para efetuar o login.
Somente o usuário 'DWU' com senha 'DWU' deve ser válido, caso seja informado usuário ou senha diferente deve ser apresentada uma mensagem de erro, caso os dados sejam válidos deve abrir a tela de cadastros.

Para a tela de cadastros, os campos necessários são:
- Sexo (Masculino ou Feminino) - Campo obrigatório
- Nome - Somente letras - Campo obrigatório
- Sobrenome - Somente letras  - Campo obrigatório 
- Idade - Somente números inteiro - Campo obrigatório   
- E-mail - Validação para e-mail que contenha @ - Campo opcional
- Salário - Somente números com duas casas decimais - Campo opcional

Deve ser possível inserir os dados de forma offline no banco de dados interno, podendo ser efetuada a atualização e exclusão do cadastro.
