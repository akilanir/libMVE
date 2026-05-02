.class public Lorg/slf4j/helpers/BasicMarker;
.super Ljava/lang/Object;
.source "BasicMarker.java"

# interfaces
.implements Lorg/slf4j/Marker;


# static fields
.field private static CLOSE:Ljava/lang/String; = null

.field private static OPEN:Ljava/lang/String; = null

.field private static SEP:Ljava/lang/String; = null

.field private static final serialVersionUID:J = 0x1908ed5291b507e7L


# instance fields
.field private final name:Ljava/lang/String;

.field private refereceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/slf4j/Marker;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 156
    const-string v0, "[ "

    sput-object v0, Lorg/slf4j/helpers/BasicMarker;->OPEN:Ljava/lang/String;

    .line 157
    const-string v0, " ]"

    sput-object v0, Lorg/slf4j/helpers/BasicMarker;->CLOSE:Ljava/lang/String;

    .line 158
    const-string v0, ", "

    sput-object v0, Lorg/slf4j/helpers/BasicMarker;->SEP:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    if-nez p1, :cond_d

    .line 49
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "A marker name cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_d
    iput-object p1, p0, Lorg/slf4j/helpers/BasicMarker;->name:Ljava/lang/String;

    .line 52
    return-void
.end method


# virtual methods
.method public declared-synchronized add(Lorg/slf4j/Marker;)V
    .registers 4
    .param p1, "reference"    # Lorg/slf4j/Marker;

    .prologue
    .line 59
    monitor-enter p0

    if-nez p1, :cond_e

    .line 60
    :try_start_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "A null value cannot be added to a Marker as reference."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_b

    .line 59
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0

    .line 65
    :cond_e
    :try_start_e
    invoke-virtual {p0, p1}, Lorg/slf4j/helpers/BasicMarker;->contains(Lorg/slf4j/Marker;)Z
    :try_end_11
    .catchall {:try_start_e .. :try_end_11} :catchall_b

    move-result v0

    if-eqz v0, :cond_16

    .line 79
    :cond_14
    :goto_14
    monitor-exit p0

    return-void

    .line 68
    :cond_16
    :try_start_16
    invoke-interface {p1, p0}, Lorg/slf4j/Marker;->contains(Lorg/slf4j/Marker;)Z

    move-result v0

    if-nez v0, :cond_14

    .line 73
    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;

    if-nez v0, :cond_27

    .line 74
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;

    .line 76
    :cond_27
    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2c
    .catchall {:try_start_16 .. :try_end_2c} :catchall_b

    goto :goto_14
.end method

.method public contains(Ljava/lang/String;)Z
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 137
    if-nez p1, :cond_b

    .line 138
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Other cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 141
    :cond_b
    iget-object v3, p0, Lorg/slf4j/helpers/BasicMarker;->name:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 153
    :cond_13
    :goto_13
    return v2

    .line 145
    :cond_14
    invoke-virtual {p0}, Lorg/slf4j/helpers/BasicMarker;->hasReferences()Z

    move-result v3

    if-eqz v3, :cond_34

    .line 146
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1b
    iget-object v3, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_34

    .line 147
    iget-object v3, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/slf4j/Marker;

    .line 148
    .local v1, "ref":Lorg/slf4j/Marker;
    invoke-interface {v1, p1}, Lorg/slf4j/Marker;->contains(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_13

    .line 146
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 153
    .end local v0    # "i":I
    .end local v1    # "ref":Lorg/slf4j/Marker;
    :cond_34
    const/4 v2, 0x0

    goto :goto_13
.end method

.method public contains(Lorg/slf4j/Marker;)Z
    .registers 6
    .param p1, "other"    # Lorg/slf4j/Marker;

    .prologue
    const/4 v2, 0x1

    .line 114
    if-nez p1, :cond_b

    .line 115
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Other cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 118
    :cond_b
    invoke-virtual {p0, p1}, Lorg/slf4j/helpers/BasicMarker;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 130
    :cond_11
    :goto_11
    return v2

    .line 122
    :cond_12
    invoke-virtual {p0}, Lorg/slf4j/helpers/BasicMarker;->hasReferences()Z

    move-result v3

    if-eqz v3, :cond_32

    .line 123
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_19
    iget-object v3, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_32

    .line 124
    iget-object v3, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/slf4j/Marker;

    .line 125
    .local v1, "ref":Lorg/slf4j/Marker;
    invoke-interface {v1, p1}, Lorg/slf4j/Marker;->contains(Lorg/slf4j/Marker;)Z

    move-result v3

    if-nez v3, :cond_11

    .line 123
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 130
    .end local v0    # "i":I
    .end local v1    # "ref":Lorg/slf4j/Marker;
    :cond_32
    const/4 v2, 0x0

    goto :goto_11
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 162
    if-ne p0, p1, :cond_5

    .line 163
    const/4 v1, 0x1

    .line 170
    :cond_4
    :goto_4
    return v1

    .line 164
    :cond_5
    if-eqz p1, :cond_4

    .line 166
    instance-of v2, p1, Lorg/slf4j/Marker;

    if-eqz v2, :cond_4

    move-object v0, p1

    .line 169
    check-cast v0, Lorg/slf4j/Marker;

    .line 170
    .local v0, "other":Lorg/slf4j/Marker;
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMarker;->name:Ljava/lang/String;

    invoke-interface {v0}, Lorg/slf4j/Marker;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_4
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->name:Ljava/lang/String;

    return-object v0
.end method

.method public hasChildren()Z
    .registers 2

    .prologue
    .line 86
    invoke-virtual {p0}, Lorg/slf4j/helpers/BasicMarker;->hasReferences()Z

    move-result v0

    return v0
.end method

.method public declared-synchronized hasReferences()Z
    .registers 2

    .prologue
    .line 82
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_12

    move-result v0

    if-lez v0, :cond_10

    const/4 v0, 0x1

    :goto_e
    monitor-exit p0

    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_e

    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 174
    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public declared-synchronized iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/slf4j/Marker;",
            ">;"
        }
    .end annotation

    .prologue
    .line 90
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;

    if-eqz v0, :cond_d

    .line 91
    iget-object v0, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_14

    move-result-object v0

    .line 93
    :goto_b
    monitor-exit p0

    return-object v0

    :cond_d
    :try_start_d
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    :try_end_12
    .catchall {:try_start_d .. :try_end_12} :catchall_14

    move-result-object v0

    goto :goto_b

    .line 90
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized remove(Lorg/slf4j/Marker;)Z
    .registers 7
    .param p1, "referenceToRemove"    # Lorg/slf4j/Marker;

    .prologue
    const/4 v3, 0x0

    .line 98
    monitor-enter p0

    :try_start_2
    iget-object v4, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;
    :try_end_4
    .catchall {:try_start_2 .. :try_end_4} :catchall_29

    if-nez v4, :cond_8

    .line 110
    :cond_6
    :goto_6
    monitor-exit p0

    return v3

    .line 102
    :cond_8
    :try_start_8
    iget-object v4, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v2

    .line 103
    .local v2, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    if-ge v0, v2, :cond_6

    .line 104
    iget-object v4, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/slf4j/Marker;

    .line 105
    .local v1, "m":Lorg/slf4j/Marker;
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_26

    .line 106
    iget-object v3, p0, Lorg/slf4j/helpers/BasicMarker;->refereceList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;
    :try_end_24
    .catchall {:try_start_8 .. :try_end_24} :catchall_29

    .line 107
    const/4 v3, 0x1

    goto :goto_6

    .line 103
    :cond_26
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 98
    .end local v0    # "i":I
    .end local v1    # "m":Lorg/slf4j/Marker;
    .end local v2    # "size":I
    :catchall_29
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 178
    invoke-virtual {p0}, Lorg/slf4j/helpers/BasicMarker;->hasReferences()Z

    move-result v3

    if-nez v3, :cond_b

    .line 179
    invoke-virtual {p0}, Lorg/slf4j/helpers/BasicMarker;->getName()Ljava/lang/String;

    move-result-object v3

    .line 194
    :goto_a
    return-object v3

    .line 181
    :cond_b
    invoke-virtual {p0}, Lorg/slf4j/helpers/BasicMarker;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 183
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/slf4j/Marker;>;"
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/slf4j/helpers/BasicMarker;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 184
    .local v2, "sb":Ljava/lang/StringBuffer;
    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v3

    sget-object v4, Lorg/slf4j/helpers/BasicMarker;->OPEN:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 185
    :cond_23
    :goto_23
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_42

    .line 186
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/slf4j/Marker;

    .line 187
    .local v1, "reference":Lorg/slf4j/Marker;
    invoke-interface {v1}, Lorg/slf4j/Marker;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 188
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    .line 189
    sget-object v3, Lorg/slf4j/helpers/BasicMarker;->SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_23

    .line 192
    .end local v1    # "reference":Lorg/slf4j/Marker;
    :cond_42
    sget-object v3, Lorg/slf4j/helpers/BasicMarker;->CLOSE:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 194
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_a
.end method
