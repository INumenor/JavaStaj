/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package KullanıcıKonrtol;

/**
 *
 * @author Batuh
 */
public class Answers_Sql 
{
    private static String[] secimler;
    private static String KacSoru;
    private static String sTur;
    private static String sIslem;
    private static String sUrl;
    
    public String getKacSoru() {
        return KacSoru;
    }

    public void setKacSoru(String KacSoru) {
        this.KacSoru = KacSoru;
    }

    public String[] getSecimler() {
        return secimler;
    }

    public void setSecimler(String[] secimler) {
        this.secimler = secimler;
    }
    
    public String getsTur() {
        return sTur;
    }

    public void setsTur(String sTur) {
        this.sTur = sTur;
    }
    public String getsIslem() {
        return sIslem;
    }

    public void setsIslem(String sIslem) {
        this.sIslem = sIslem;
    }
    public String getsUrl() {
        return sUrl;
    }

    public void setsUrl(String Url) {
        this.sUrl = Url;
    }
}
