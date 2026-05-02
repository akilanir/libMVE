package ezvcard.io.scribe;

import ezvcard.property.Note;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/NoteScribe.class */
public class NoteScribe extends StringPropertyScribe<Note> {
    public NoteScribe() {
        super(Note.class, "NOTE");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Note _parseValue(String value) {
        return new Note(value);
    }
}
