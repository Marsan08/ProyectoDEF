/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author Marsan
 */
public class PGanadera extends Parcela {
    
    private int idpganadera;
    
    private int idparcela;

    public int getIdparcela() {
        return idparcela;
    }

    public void setIdparcela(int idparcela) {
        this.idparcela = idparcela;
    }

    public PGanadera(int idpganadera, int idparcela) {
        this.idpganadera = idpganadera;
        this.idparcela = idparcela;
    }
        

    public int getIdpganadera() {
        return idpganadera;
    }

    public void setIdpganadera(int idpganadera) {
        this.idpganadera = idpganadera;
    }

    public PGanadera() {
    }

    public PGanadera(int idpganadera, int idparcela, int hectareas, int idpropietario, int idestado, int idtipoparcela, int referencia) {
        super(idparcela, hectareas, idpropietario, idestado, idtipoparcela, referencia);
        this.idpganadera = idpganadera;
    }

    public PGanadera(int idpganadera) {
        this.idpganadera = idpganadera;
    }
    
    
    
}
