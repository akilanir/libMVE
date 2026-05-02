package com.google.gson;

import com.google.gson.internal.C$Gson$Preconditions;
import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import java.util.Collection;

/* loaded from: gson-1.7.2.jar:com/google/gson/ModifyFirstLetterNamingPolicy.class */
final class ModifyFirstLetterNamingPolicy extends RecursiveFieldNamingPolicy {
    private final LetterModifier letterModifier;

    /* loaded from: gson-1.7.2.jar:com/google/gson/ModifyFirstLetterNamingPolicy$LetterModifier.class */
    public enum LetterModifier {
        UPPER,
        LOWER
    }

    ModifyFirstLetterNamingPolicy(LetterModifier modifier) {
        this.letterModifier = (LetterModifier) C$Gson$Preconditions.checkNotNull(modifier);
    }

    @Override // com.google.gson.RecursiveFieldNamingPolicy
    protected String translateName(String target, Type fieldType, Collection<Annotation> annotations) {
        char firstCharacter;
        StringBuilder fieldNameBuilder = new StringBuilder();
        int index = 0;
        char charAt = target.charAt(0);
        while (true) {
            firstCharacter = charAt;
            if (index >= target.length() - 1 || Character.isLetter(firstCharacter)) {
                break;
            }
            fieldNameBuilder.append(firstCharacter);
            index++;
            charAt = target.charAt(index);
        }
        if (index == target.length()) {
            return fieldNameBuilder.toString();
        }
        boolean capitalizeFirstLetter = this.letterModifier == LetterModifier.UPPER;
        if (capitalizeFirstLetter && !Character.isUpperCase(firstCharacter)) {
            String modifiedTarget = modifyString(Character.toUpperCase(firstCharacter), target, index + 1);
            return fieldNameBuilder.append(modifiedTarget).toString();
        }
        if (!capitalizeFirstLetter && Character.isUpperCase(firstCharacter)) {
            String modifiedTarget2 = modifyString(Character.toLowerCase(firstCharacter), target, index + 1);
            return fieldNameBuilder.append(modifiedTarget2).toString();
        }
        return target;
    }

    private String modifyString(char firstCharacter, String srcString, int indexOfSubstring) {
        return indexOfSubstring < srcString.length() ? firstCharacter + srcString.substring(indexOfSubstring) : String.valueOf(firstCharacter);
    }
}
