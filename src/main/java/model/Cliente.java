package model;

import java.time.LocalDateTime;

public class Cliente {

    private int id;
    private String nome;
    private String telefone;
    private String uf;
    private String cep;
    private String complemento;
    private String cpf;
    private String numeroProcesso;
    private int statusCliente;
    private LocalDateTime dataCadastro;

    //Não é usado pelo construtor do objeto cliente, mas serve para retornar
    //a descrição do status_cliente, que faz parte de uma tabela diferente no banco.
    private String descricaoStatus;

    //Construtor de Cliente somente com dados obrigatórios, usado no cadastro
    public Cliente (String nome, String telefone, String uf) {
        this.nome = nome;
        this.telefone = telefone;
        this.uf = uf;
    }

    //Construtor de Cliente com todos os dados
    public Cliente(int id, String nome, String telefone, String uf, String cep,
                   String complemento, String cpf, String numeroProcesso, int statusCliente,
                   LocalDateTime dataCadastro) {
        this.id = id;
        this.nome = nome;
        this.telefone = telefone;
        this.uf = uf;
        this.cep = cep;
        this.complemento = complemento;
        this.cpf = cpf;
        this.numeroProcesso = numeroProcesso;
        this.statusCliente = statusCliente;
        this.dataCadastro = dataCadastro;
    }

    //Getters e Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNumeroProcesso() {
        return numeroProcesso;
    }

    public void setNumeroProcesso(String numeroProcesso) {
        this.numeroProcesso = numeroProcesso;
    }

    public int getStatusCliente() {
        return statusCliente;
    }

    public void setStatusCliente(int statusCliente) {
        this.statusCliente = statusCliente;
    }

    public LocalDateTime getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(LocalDateTime dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public String getDescricaoStatus() {
        return descricaoStatus;
    }

    public void setDescricaoStatus(String descricaoStatus) {
        this.descricaoStatus = descricaoStatus;
    }
}
