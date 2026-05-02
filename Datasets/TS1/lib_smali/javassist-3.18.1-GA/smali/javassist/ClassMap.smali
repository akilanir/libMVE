.class public Ljavassist/ClassMap;
.super Ljava/util/HashMap;
.source "ClassMap.java"


# instance fields
.field private parent:Ljavassist/ClassMap;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/ClassMap;->parent:Ljavassist/ClassMap;

    return-void
.end method

.method constructor <init>(Ljavassist/ClassMap;)V
    .registers 2
    .param p1, "map"    # Ljavassist/ClassMap;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Ljavassist/ClassMap;->parent:Ljavassist/ClassMap;

    return-void
.end method

.method public static toJavaName(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "classname"    # Ljava/lang/String;

    .prologue
    .line 171
    invoke-static {p0}, Ljavassist/bytecode/Descriptor;->toJavaName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toJvmName(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "classname"    # Ljava/lang/String;

    .prologue
    .line 163
    invoke-static {p0}, Ljavassist/bytecode/Descriptor;->toJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public fix(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 154
    invoke-static {p1}, Ljavassist/ClassMap;->toJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 155
    .local v0, "name2":Ljava/lang/String;
    invoke-super {p0, v0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    return-void
.end method

.method public fix(Ljavassist/CtClass;)V
    .registers 3
    .param p1, "clazz"    # Ljavassist/CtClass;

    .prologue
    .line 147
    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljavassist/ClassMap;->fix(Ljava/lang/String;)V

    .line 148
    return-void
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "jvmClassName"    # Ljava/lang/Object;

    .prologue
    .line 136
    invoke-super {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 137
    .local v0, "found":Ljava/lang/Object;
    if-nez v0, :cond_10

    iget-object v1, p0, Ljavassist/ClassMap;->parent:Ljavassist/ClassMap;

    if-eqz v1, :cond_10

    .line 138
    iget-object v1, p0, Ljavassist/ClassMap;->parent:Ljavassist/ClassMap;

    invoke-virtual {v1, p1}, Ljavassist/ClassMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 140
    .end local v0    # "found":Ljava/lang/Object;
    :cond_10
    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "oldname"    # Ljava/lang/String;
    .param p2, "newname"    # Ljava/lang/String;

    .prologue
    .line 93
    if-ne p1, p2, :cond_3

    .line 100
    :cond_2
    :goto_2
    return-void

    .line 96
    :cond_3
    invoke-static {p1}, Ljavassist/ClassMap;->toJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "oldname2":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljavassist/ClassMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 98
    .local v1, "s":Ljava/lang/String;
    if-eqz v1, :cond_15

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 99
    :cond_15
    invoke-static {p2}, Ljavassist/ClassMap;->toJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-super {p0, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2
.end method

.method public put(Ljavassist/CtClass;Ljavassist/CtClass;)V
    .registers 5
    .param p1, "oldname"    # Ljavassist/CtClass;
    .param p2, "newname"    # Ljavassist/CtClass;

    .prologue
    .line 71
    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljavassist/ClassMap;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method protected final put0(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p1, "oldname"    # Ljava/lang/Object;
    .param p2, "newname"    # Ljava/lang/Object;

    .prologue
    .line 122
    invoke-super {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    return-void
.end method

.method public putIfNone(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "oldname"    # Ljava/lang/String;
    .param p2, "newname"    # Ljava/lang/String;

    .prologue
    .line 112
    if-ne p1, p2, :cond_3

    .line 119
    :cond_2
    :goto_2
    return-void

    .line 115
    :cond_3
    invoke-static {p1}, Ljavassist/ClassMap;->toJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "oldname2":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljavassist/ClassMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 117
    .local v1, "s":Ljava/lang/String;
    if-nez v1, :cond_2

    .line 118
    invoke-static {p2}, Ljavassist/ClassMap;->toJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-super {p0, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2
.end method
