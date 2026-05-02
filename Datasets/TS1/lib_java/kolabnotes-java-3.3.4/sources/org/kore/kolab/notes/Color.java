package org.kore.kolab.notes;

import java.io.Serializable;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/Color.class */
public interface Color extends Serializable {
    String getHexcode();

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/Color$DefaultImpl.class */
    public static class DefaultImpl implements Color {
        private final String hexCode;

        public DefaultImpl(String hexCode) {
            this.hexCode = hexCode;
        }

        @Override // org.kore.kolab.notes.Color
        public String getHexcode() {
            return this.hexCode;
        }

        public String toString() {
            return "DefaultImpl{hexCode=" + this.hexCode + '}';
        }

        public int hashCode() {
            int hash = (97 * 5) + (this.hexCode != null ? this.hexCode.hashCode() : 0);
            return hash;
        }

        public boolean equals(Object obj) {
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            DefaultImpl other = (DefaultImpl) obj;
            if (this.hexCode == null) {
                if (other.hexCode != null) {
                    return false;
                }
                return true;
            }
            if (!this.hexCode.equals(other.hexCode)) {
                return false;
            }
            return true;
        }
    }
}
