.class public abstract Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "ReflectionTemplateBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/msgpack/template/builder/ReflectionTemplateBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "ReflectionFieldTemplate"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/msgpack/template/AbstractTemplate",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field protected entry:Lorg/msgpack/template/builder/FieldEntry;


# direct methods
.method constructor <init>(Lorg/msgpack/template/builder/FieldEntry;)V
    .registers 2
    .param p1, "entry"    # Lorg/msgpack/template/builder/FieldEntry;

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 43
    iput-object p1, p0, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;->entry:Lorg/msgpack/template/builder/FieldEntry;

    .line 44
    return-void
.end method


# virtual methods
.method setNil(Ljava/lang/Object;)V
    .registers 4
    .param p1, "v"    # Ljava/lang/Object;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;->entry:Lorg/msgpack/template/builder/FieldEntry;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lorg/msgpack/template/builder/FieldEntry;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 48
    return-void
.end method
