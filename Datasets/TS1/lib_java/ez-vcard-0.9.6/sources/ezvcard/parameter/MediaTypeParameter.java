package ezvcard.parameter;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/MediaTypeParameter.class */
public class MediaTypeParameter extends VCardParameter {
    protected final String mediaType;
    protected final String extension;

    public MediaTypeParameter(String value, String mediaType, String extension) {
        super(value);
        this.mediaType = mediaType;
        this.extension = extension;
    }

    public String getMediaType() {
        return this.mediaType;
    }

    public String getExtension() {
        return this.extension;
    }

    @Override // ezvcard.parameter.VCardParameter
    public int hashCode() {
        int result = super.hashCode();
        return (31 * ((31 * result) + (this.extension == null ? 0 : this.extension.hashCode()))) + (this.mediaType == null ? 0 : this.mediaType.hashCode());
    }

    @Override // ezvcard.parameter.VCardParameter
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!super.equals(obj) || getClass() != obj.getClass()) {
            return false;
        }
        MediaTypeParameter other = (MediaTypeParameter) obj;
        if (this.extension == null) {
            if (other.extension != null) {
                return false;
            }
        } else if (!this.extension.equals(other.extension)) {
            return false;
        }
        if (this.mediaType == null) {
            if (other.mediaType != null) {
                return false;
            }
            return true;
        }
        if (!this.mediaType.equals(other.mediaType)) {
            return false;
        }
        return true;
    }
}
