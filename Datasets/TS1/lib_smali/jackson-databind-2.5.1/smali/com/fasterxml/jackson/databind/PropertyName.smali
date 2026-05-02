.class public Lcom/fasterxml/jackson/databind/PropertyName;
.super Ljava/lang/Object;
.source "PropertyName.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final NO_NAME:Lcom/fasterxml/jackson/databind/PropertyName;

.field public static final USE_DEFAULT:Lcom/fasterxml/jackson/databind/PropertyName;

.field private static final _NO_NAME:Ljava/lang/String; = ""

.field private static final _USE_DEFAULT:Ljava/lang/String; = ""

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected _encodedSimple:Lcom/fasterxml/jackson/core/SerializableString;

.field protected final _namespace:Ljava/lang/String;

.field protected final _simpleName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 28
    new-instance v0, Lcom/fasterxml/jackson/databind/PropertyName;

    const-string v1, ""

    invoke-direct {v0, v1, v3}, Lcom/fasterxml/jackson/databind/PropertyName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/fasterxml/jackson/databind/PropertyName;->USE_DEFAULT:Lcom/fasterxml/jackson/databind/PropertyName;

    .line 35
    new-instance v0, Lcom/fasterxml/jackson/databind/PropertyName;

    new-instance v1, Ljava/lang/String;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1, v3}, Lcom/fasterxml/jackson/databind/PropertyName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/fasterxml/jackson/databind/PropertyName;->NO_NAME:Lcom/fasterxml/jackson/databind/PropertyName;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "simpleName"    # Ljava/lang/String;

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/fasterxml/jackson/databind/PropertyName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "simpleName"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    if-nez p1, :cond_7

    const-string p1, ""

    .end local p1    # "simpleName":Ljava/lang/String;
    :cond_7
    iput-object p1, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    .line 66
    iput-object p2, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public static construct(Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;
    .registers 3
    .param p0, "simpleName"    # Ljava/lang/String;
    .param p1, "ns"    # Ljava/lang/String;

    .prologue
    .line 82
    if-nez p0, :cond_4

    .line 83
    const-string p0, ""

    .line 85
    :cond_4
    if-nez p1, :cond_f

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_f

    .line 86
    sget-object v0, Lcom/fasterxml/jackson/databind/PropertyName;->USE_DEFAULT:Lcom/fasterxml/jackson/databind/PropertyName;

    .line 88
    :goto_e
    return-object v0

    :cond_f
    new-instance v0, Lcom/fasterxml/jackson/databind/PropertyName;

    invoke-direct {v0, p0, p1}, Lcom/fasterxml/jackson/databind/PropertyName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 206
    if-ne p1, p0, :cond_6

    move v2, v1

    .line 225
    :cond_5
    :goto_5
    return v2

    .line 207
    :cond_6
    if-eqz p1, :cond_5

    .line 211
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-ne v3, v4, :cond_5

    move-object v0, p1

    .line 216
    check-cast v0, Lcom/fasterxml/jackson/databind/PropertyName;

    .line 217
    .local v0, "other":Lcom/fasterxml/jackson/databind/PropertyName;
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    if-nez v3, :cond_27

    .line 218
    iget-object v3, v0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    if-nez v3, :cond_5

    .line 222
    :cond_1d
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    if-nez v3, :cond_34

    .line 223
    iget-object v3, v0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    if-nez v3, :cond_32

    :goto_25
    move v2, v1

    goto :goto_5

    .line 219
    :cond_27
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    iget-object v4, v0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1d

    goto :goto_5

    :cond_32
    move v1, v2

    .line 223
    goto :goto_25

    .line 225
    :cond_34
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    iget-object v2, v0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_5
.end method

.method public getNamespace()Ljava/lang/String;
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    return-object v0
.end method

.method public getSimpleName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    return-object v0
.end method

.method public hasNamespace()Z
    .registers 2

    .prologue
    .line 182
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public hasSimpleName()Z
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public hasSimpleName(Ljava/lang/String;)Z
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 175
    if-nez p1, :cond_a

    .line 176
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    if-nez v0, :cond_8

    const/4 v0, 0x1

    .line 178
    :goto_7
    return v0

    .line 176
    :cond_8
    const/4 v0, 0x0

    goto :goto_7

    .line 178
    :cond_a
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_7
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 230
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    if-nez v0, :cond_b

    .line 231
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 233
    :goto_a
    return v0

    :cond_b
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    goto :goto_a
.end method

.method public internSimpleName()Lcom/fasterxml/jackson/databind/PropertyName;
    .registers 4

    .prologue
    .line 93
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_9

    .line 100
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/PropertyName;
    :cond_8
    :goto_8
    return-object p0

    .line 96
    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/PropertyName;
    :cond_9
    sget-object v1, Lcom/fasterxml/jackson/core/util/InternCache;->instance:Lcom/fasterxml/jackson/core/util/InternCache;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/core/util/InternCache;->intern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "interned":Ljava/lang/String;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    if-eq v0, v1, :cond_8

    .line 100
    new-instance v1, Lcom/fasterxml/jackson/databind/PropertyName;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    invoke-direct {v1, v0, v2}, Lcom/fasterxml/jackson/databind/PropertyName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object p0, v1

    goto :goto_8
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 194
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    if-nez v0, :cond_e

    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected readResolve()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 71
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    if-eqz v0, :cond_e

    const-string v0, ""

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 72
    :cond_e
    sget-object p0, Lcom/fasterxml/jackson/databind/PropertyName;->USE_DEFAULT:Lcom/fasterxml/jackson/databind/PropertyName;

    .line 77
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/PropertyName;
    :cond_10
    :goto_10
    return-object p0

    .line 74
    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/PropertyName;
    :cond_11
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    if-nez v0, :cond_10

    .line 75
    sget-object p0, Lcom/fasterxml/jackson/databind/PropertyName;->NO_NAME:Lcom/fasterxml/jackson/databind/PropertyName;

    goto :goto_10
.end method

.method public simpleAsEncoded(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;)Lcom/fasterxml/jackson/core/SerializableString;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/cfg/MapperConfig",
            "<*>;)",
            "Lcom/fasterxml/jackson/core/SerializableString;"
        }
    .end annotation

    .prologue
    .line 151
    .local p1, "config":Lcom/fasterxml/jackson/databind/cfg/MapperConfig;, "Lcom/fasterxml/jackson/databind/cfg/MapperConfig<*>;"
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_encodedSimple:Lcom/fasterxml/jackson/core/SerializableString;

    .line 152
    .local v0, "sstr":Lcom/fasterxml/jackson/core/SerializableString;
    if-nez v0, :cond_f

    .line 153
    if-nez p1, :cond_10

    .line 154
    new-instance v0, Lcom/fasterxml/jackson/core/io/SerializedString;

    .end local v0    # "sstr":Lcom/fasterxml/jackson/core/SerializableString;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/core/io/SerializedString;-><init>(Ljava/lang/String;)V

    .line 158
    .restart local v0    # "sstr":Lcom/fasterxml/jackson/core/SerializableString;
    :goto_d
    iput-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_encodedSimple:Lcom/fasterxml/jackson/core/SerializableString;

    .line 160
    :cond_f
    return-object v0

    .line 156
    :cond_10
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/databind/cfg/MapperConfig;->compileString(Ljava/lang/String;)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v0

    goto :goto_d
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 238
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    if-nez v0, :cond_7

    .line 239
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    .line 241
    :goto_6
    return-object v0

    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public withNamespace(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;
    .registers 4
    .param p1, "ns"    # Ljava/lang/String;

    .prologue
    .line 124
    if-nez p1, :cond_7

    .line 125
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    if-nez v0, :cond_f

    .line 131
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/PropertyName;
    :cond_6
    :goto_6
    return-object p0

    .line 128
    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/PropertyName;
    :cond_7
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 131
    :cond_f
    new-instance v0, Lcom/fasterxml/jackson/databind/PropertyName;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    invoke-direct {v0, v1, p1}, Lcom/fasterxml/jackson/databind/PropertyName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object p0, v0

    goto :goto_6
.end method

.method public withSimpleName(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;
    .registers 4
    .param p1, "simpleName"    # Ljava/lang/String;

    .prologue
    .line 110
    if-nez p1, :cond_4

    .line 111
    const-string p1, ""

    .line 113
    :cond_4
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_simpleName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 116
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/PropertyName;
    :goto_c
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/PropertyName;
    :cond_d
    new-instance v0, Lcom/fasterxml/jackson/databind/PropertyName;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/PropertyName;->_namespace:Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Lcom/fasterxml/jackson/databind/PropertyName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object p0, v0

    goto :goto_c
.end method
