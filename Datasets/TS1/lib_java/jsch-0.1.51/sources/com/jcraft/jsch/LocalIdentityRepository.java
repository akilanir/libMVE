package com.jcraft.jsch;

import java.util.Vector;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/LocalIdentityRepository.class */
class LocalIdentityRepository implements IdentityRepository {
    private static final String name = "Local Identity Repository";
    private Vector identities = new Vector();
    private JSch jsch;

    LocalIdentityRepository(JSch jsch) {
        this.jsch = jsch;
    }

    @Override // com.jcraft.jsch.IdentityRepository
    public String getName() {
        return name;
    }

    @Override // com.jcraft.jsch.IdentityRepository
    public int getStatus() {
        return 2;
    }

    @Override // com.jcraft.jsch.IdentityRepository
    public synchronized Vector getIdentities() {
        Vector v = new Vector();
        for (int i = 0; i < this.identities.size(); i++) {
            v.addElement(this.identities.elementAt(i));
        }
        return v;
    }

    public synchronized void add(Identity identity) {
        if (!this.identities.contains(identity)) {
            this.identities.addElement(identity);
        }
    }

    @Override // com.jcraft.jsch.IdentityRepository
    public synchronized boolean add(byte[] identity) {
        try {
            this.identities.addElement(IdentityFile.newInstance("from remote:", identity, null, this.jsch));
            return true;
        } catch (JSchException e) {
            return false;
        }
    }

    synchronized void remove(Identity identity) {
        this.identities.removeElement(identity);
    }

    @Override // com.jcraft.jsch.IdentityRepository
    public synchronized boolean remove(byte[] blob) {
        if (blob == null) {
            return false;
        }
        for (int i = 0; i < this.identities.size(); i++) {
            Identity _identity = (Identity) this.identities.elementAt(i);
            byte[] _blob = _identity.getPublicKeyBlob();
            if (_blob != null && Util.array_equals(blob, _blob)) {
                this.identities.removeElement(_identity);
                _identity.clear();
                return true;
            }
        }
        return false;
    }

    @Override // com.jcraft.jsch.IdentityRepository
    public synchronized void removeAll() {
        for (int i = 0; i < this.identities.size(); i++) {
            Identity identity = (Identity) this.identities.elementAt(i);
            identity.clear();
        }
        this.identities.removeAllElements();
    }
}
