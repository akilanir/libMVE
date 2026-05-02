.class public Lorg/msgpack/template/builder/DefaultFieldEntry;
.super Lorg/msgpack/template/builder/FieldEntry;
.source "DefaultFieldEntry.java"


# instance fields
.field protected field:Ljava/lang/reflect/Field;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 30
    const/4 v0, 0x0

    sget-object v1, Lorg/msgpack/template/FieldOption;->IGNORE:Lorg/msgpack/template/FieldOption;

    invoke-direct {p0, v0, v1}, Lorg/msgpack/template/builder/DefaultFieldEntry;-><init>(Ljava/lang/reflect/Field;Lorg/msgpack/template/FieldOption;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/lang/reflect/Field;Lorg/msgpack/template/FieldOption;)V
    .registers 3
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "option"    # Lorg/msgpack/template/FieldOption;

    .prologue
    .line 38
    invoke-direct {p0, p2}, Lorg/msgpack/template/builder/FieldEntry;-><init>(Lorg/msgpack/template/FieldOption;)V

    .line 39
    iput-object p1, p0, Lorg/msgpack/template/builder/DefaultFieldEntry;->field:Ljava/lang/reflect/Field;

    .line 40
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/builder/DefaultFieldEntry;)V
    .registers 4
    .param p1, "e"    # Lorg/msgpack/template/builder/DefaultFieldEntry;

    .prologue
    .line 34
    iget-object v0, p1, Lorg/msgpack/template/builder/DefaultFieldEntry;->field:Ljava/lang/reflect/Field;

    iget-object v1, p1, Lorg/msgpack/template/builder/DefaultFieldEntry;->option:Lorg/msgpack/template/FieldOption;

    invoke-direct {p0, v0, v1}, Lorg/msgpack/template/builder/DefaultFieldEntry;-><init>(Ljava/lang/reflect/Field;Lorg/msgpack/template/FieldOption;)V

    .line 35
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "target"    # Ljava/lang/Object;

    .prologue
    .line 68
    :try_start_0
    invoke-virtual {p0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getField()Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_7} :catch_9
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_7} :catch_10

    move-result-object v1

    return-object v1

    .line 69
    :catch_9
    move-exception v0

    .line 70
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 71
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_10
    move-exception v0

    .line 72
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getField()Ljava/lang/reflect/Field;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lorg/msgpack/template/builder/DefaultFieldEntry;->field:Ljava/lang/reflect/Field;

    return-object v0
.end method

.method public getGenericType()Ljava/lang/reflect/Type;
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Lorg/msgpack/template/builder/DefaultFieldEntry;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lorg/msgpack/template/builder/DefaultFieldEntry;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lorg/msgpack/template/builder/DefaultFieldEntry;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public set(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 79
    :try_start_0
    iget-object v1, p0, Lorg/msgpack/template/builder/DefaultFieldEntry;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p1, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_5} :catch_6
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_5} :catch_d

    .line 85
    return-void

    .line 80
    :catch_6
    move-exception v0

    .line 81
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 82
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_d
    move-exception v0

    .line 83
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setField(Ljava/lang/reflect/Field;)V
    .registers 2
    .param p1, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .line 47
    iput-object p1, p0, Lorg/msgpack/template/builder/DefaultFieldEntry;->field:Ljava/lang/reflect/Field;

    .line 48
    return-void
.end method
