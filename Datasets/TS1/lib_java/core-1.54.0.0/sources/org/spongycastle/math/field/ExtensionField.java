package org.spongycastle.math.field;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/math/field/ExtensionField.class */
public interface ExtensionField extends FiniteField {
    FiniteField getSubfield();

    int getDegree();
}
