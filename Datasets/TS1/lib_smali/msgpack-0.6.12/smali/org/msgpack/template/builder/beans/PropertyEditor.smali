.class public interface abstract Lorg/msgpack/template/builder/beans/PropertyEditor;
.super Ljava/lang/Object;
.source "PropertyEditor.java"


# virtual methods
.method public abstract addPropertyChangeListener(Lorg/msgpack/template/builder/beans/PropertyChangeListener;)V
.end method

.method public abstract getAsText()Ljava/lang/String;
.end method

.method public abstract getJavaInitializationString()Ljava/lang/String;
.end method

.method public abstract getTags()[Ljava/lang/String;
.end method

.method public abstract getValue()Ljava/lang/Object;
.end method

.method public abstract isPaintable()Z
.end method

.method public abstract removePropertyChangeListener(Lorg/msgpack/template/builder/beans/PropertyChangeListener;)V
.end method

.method public abstract setAsText(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract setValue(Ljava/lang/Object;)V
.end method

.method public abstract supportsCustomEditor()Z
.end method
