package com.google.gson;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;

/* loaded from: gson-1.7.2.jar:com/google/gson/ModifierBasedExclusionStrategy.class */
final class ModifierBasedExclusionStrategy implements ExclusionStrategy {
    private final Collection<Integer> modifiers = new HashSet();

    public ModifierBasedExclusionStrategy(int... modifiers) {
        if (modifiers != null) {
            for (int modifier : modifiers) {
                this.modifiers.add(Integer.valueOf(modifier));
            }
        }
    }

    @Override // com.google.gson.ExclusionStrategy
    public boolean shouldSkipField(FieldAttributes f) {
        Iterator i$ = this.modifiers.iterator();
        while (i$.hasNext()) {
            int modifier = i$.next().intValue();
            if (f.hasModifier(modifier)) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.gson.ExclusionStrategy
    public boolean shouldSkipClass(Class<?> clazz) {
        return false;
    }
}
