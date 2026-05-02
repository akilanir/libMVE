.class public abstract Lorg/springframework/util/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# static fields
.field private static final CURRENT_PATH:Ljava/lang/String; = "."

.field private static final EXTENSION_SEPARATOR:C = '.'

.field private static final FOLDER_SEPARATOR:Ljava/lang/String; = "/"

.field private static final TOP_PATH:Ljava/lang/String; = ".."

.field private static final WINDOWS_FOLDER_SEPARATOR:Ljava/lang/String; = "\\"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addStringToArray([Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .registers 5
    .param p0, "array"    # [Ljava/lang/String;
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 719
    invoke-static {p0}, Lorg/springframework/util/ObjectUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 720
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    aput-object p1, v0, v2

    .line 725
    :goto_c
    return-object v0

    .line 722
    :cond_d
    array-length v1, p0

    add-int/lit8 v1, v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    .line 723
    .local v0, "newArr":[Ljava/lang/String;
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 724
    array-length v1, p0

    aput-object p1, v0, v1

    goto :goto_c
.end method

.method public static applyRelativePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "relativePath"    # Ljava/lang/String;

    .prologue
    .line 573
    const-string v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 574
    .local v1, "separatorIndex":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_3a

    .line 575
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 576
    .local v0, "newPath":Ljava/lang/String;
    const-string v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_29

    .line 577
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 579
    :cond_29
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 582
    .end local v0    # "newPath":Ljava/lang/String;
    .end local p1    # "relativePath":Ljava/lang/String;
    :cond_3a
    return-object p1
.end method

.method public static arrayToCommaDelimitedString([Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .param p0, "arr"    # [Ljava/lang/Object;

    .prologue
    .line 1138
    const-string v0, ","

    invoke-static {p0, v0}, Lorg/springframework/util/StringUtils;->arrayToDelimitedString([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static arrayToDelimitedString([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "arr"    # [Ljava/lang/Object;
    .param p1, "delim"    # Ljava/lang/String;

    .prologue
    .line 1115
    invoke-static {p0}, Lorg/springframework/util/ObjectUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 1116
    const-string v2, ""

    .line 1128
    :goto_8
    return-object v2

    .line 1118
    :cond_9
    array-length v2, p0

    const/4 v3, 0x1

    if-ne v2, v3, :cond_15

    .line 1119
    const/4 v2, 0x0

    aget-object v2, p0, v2

    invoke-static {v2}, Lorg/springframework/util/ObjectUtils;->nullSafeToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_8

    .line 1121
    :cond_15
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1122
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1b
    array-length v2, p0

    if-ge v0, v2, :cond_2b

    .line 1123
    if-lez v0, :cond_23

    .line 1124
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1126
    :cond_23
    aget-object v2, p0, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1122
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 1128
    :cond_2b
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_8
.end method

.method public static capitalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 478
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/springframework/util/StringUtils;->changeFirstCharacterCase(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static changeFirstCharacterCase(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "capitalize"    # Z

    .prologue
    const/4 v2, 0x0

    .line 493
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_a

    .line 504
    .end local p0    # "str":Ljava/lang/String;
    :cond_9
    :goto_9
    return-object p0

    .line 496
    .restart local p0    # "str":Ljava/lang/String;
    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 497
    .local v0, "sb":Ljava/lang/StringBuilder;
    if-eqz p1, :cond_2d

    .line 498
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 503
    :goto_20
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 504
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_9

    .line 501
    :cond_2d
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_20
.end method

.method public static cleanPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 595
    if-nez p0, :cond_5

    .line 596
    const/4 v8, 0x0

    .line 645
    :goto_4
    return-object v8

    .line 598
    :cond_5
    const-string v8, "\\"

    const-string v9, "/"

    invoke-static {p0, v8, v9}, Lorg/springframework/util/StringUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 604
    .local v4, "pathToUse":Ljava/lang/String;
    const-string v8, ":"

    invoke-virtual {v4, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    .line 605
    .local v6, "prefixIndex":I
    const-string v5, ""

    .line 606
    .local v5, "prefix":Ljava/lang/String;
    const/4 v8, -0x1

    if-eq v6, v8, :cond_24

    .line 607
    add-int/lit8 v8, v6, 0x1

    invoke-virtual {v4, v10, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 608
    add-int/lit8 v8, v6, 0x1

    invoke-virtual {v4, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 610
    :cond_24
    const-string v8, "/"

    invoke-virtual {v4, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_44

    .line 611
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 612
    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 615
    :cond_44
    const-string v8, "/"

    invoke-static {v4, v8}, Lorg/springframework/util/StringUtils;->delimitedListToStringArray(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 616
    .local v2, "pathArray":[Ljava/lang/String;
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 617
    .local v3, "pathElements":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v7, 0x0

    .line 619
    .local v7, "tops":I
    array-length v8, v2

    add-int/lit8 v1, v8, -0x1

    .local v1, "i":I
    :goto_53
    if-ltz v1, :cond_76

    .line 620
    aget-object v0, v2, v1

    .line 621
    .local v0, "element":Ljava/lang/String;
    const-string v8, "."

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_62

    .line 619
    :goto_5f
    add-int/lit8 v1, v1, -0x1

    goto :goto_53

    .line 624
    :cond_62
    const-string v8, ".."

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6d

    .line 626
    add-int/lit8 v7, v7, 0x1

    goto :goto_5f

    .line 629
    :cond_6d
    if-lez v7, :cond_72

    .line 631
    add-int/lit8 v7, v7, -0x1

    goto :goto_5f

    .line 635
    :cond_72
    invoke-interface {v3, v10, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_5f

    .line 641
    .end local v0    # "element":Ljava/lang/String;
    :cond_76
    const/4 v1, 0x0

    :goto_77
    if-ge v1, v7, :cond_81

    .line 642
    const-string v8, ".."

    invoke-interface {v3, v10, v8}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 641
    add-int/lit8 v1, v1, 0x1

    goto :goto_77

    .line 645
    :cond_81
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-static {v3, v9}, Lorg/springframework/util/StringUtils;->collectionToDelimitedString(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_4
.end method

.method public static collectionToCommaDelimitedString(Ljava/util/Collection;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1104
    .local p0, "coll":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const-string v0, ","

    invoke-static {p0, v0}, Lorg/springframework/util/StringUtils;->collectionToDelimitedString(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static collectionToDelimitedString(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "delim"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1094
    .local p0, "coll":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const-string v0, ""

    const-string v1, ""

    invoke-static {p0, p1, v0, v1}, Lorg/springframework/util/StringUtils;->collectionToDelimitedString(Ljava/util/Collection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static collectionToDelimitedString(Ljava/util/Collection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "delim"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "suffix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1072
    .local p0, "coll":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    invoke-static {p0}, Lorg/springframework/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 1073
    const-string v2, ""

    .line 1083
    :goto_8
    return-object v2

    .line 1075
    :cond_9
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1076
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1077
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_12
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_31

    .line 1078
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1079
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 1080
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_12

    .line 1083
    :cond_31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_8
.end method

.method public static commaDelimitedListToSet(Ljava/lang/String;)Ljava/util/Set;
    .registers 7
    .param p0, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1054
    new-instance v3, Ljava/util/TreeSet;

    invoke-direct {v3}, Ljava/util/TreeSet;-><init>()V

    .line 1055
    .local v3, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->commaDelimitedListToStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 1056
    .local v5, "tokens":[Ljava/lang/String;
    move-object v0, v5

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_c
    if-ge v1, v2, :cond_16

    aget-object v4, v0, v1

    .line 1057
    .local v4, "token":Ljava/lang/String;
    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1056
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 1059
    .end local v4    # "token":Ljava/lang/String;
    :cond_16
    return-object v3
.end method

.method public static commaDelimitedListToStringArray(Ljava/lang/String;)[Ljava/lang/String;
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 1044
    const-string v0, ","

    invoke-static {p0, v0}, Lorg/springframework/util/StringUtils;->delimitedListToStringArray(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static concatenateStringArrays([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
    .registers 6
    .param p0, "array1"    # [Ljava/lang/String;
    .param p1, "array2"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 737
    invoke-static {p0}, Lorg/springframework/util/ObjectUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 746
    .end local p1    # "array2":[Ljava/lang/String;
    :goto_7
    return-object p1

    .line 740
    .restart local p1    # "array2":[Ljava/lang/String;
    :cond_8
    invoke-static {p1}, Lorg/springframework/util/ObjectUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    move-object p1, p0

    .line 741
    goto :goto_7

    .line 743
    :cond_10
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [Ljava/lang/String;

    .line 744
    .local v0, "newArr":[Ljava/lang/String;
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 745
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p1, v0

    .line 746
    goto :goto_7
.end method

.method public static containsWhitespace(Ljava/lang/CharSequence;)Z
    .registers 5
    .param p0, "str"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v2, 0x0

    .line 149
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 158
    :cond_7
    :goto_7
    return v2

    .line 152
    :cond_8
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 153
    .local v1, "strLen":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    if-ge v0, v1, :cond_7

    .line 154
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 155
    const/4 v2, 0x1

    goto :goto_7

    .line 153
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_d
.end method

.method public static containsWhitespace(Ljava/lang/String;)Z
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 169
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->containsWhitespace(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public static countOccurrencesOf(Ljava/lang/String;Ljava/lang/String;)I
    .registers 6
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "sub"    # Ljava/lang/String;

    .prologue
    .line 353
    if-eqz p0, :cond_10

    if-eqz p1, :cond_10

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_10

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_12

    .line 354
    :cond_10
    const/4 v0, 0x0

    .line 363
    :cond_11
    return v0

    .line 356
    :cond_12
    const/4 v0, 0x0

    .line 357
    .local v0, "count":I
    const/4 v2, 0x0

    .line 359
    .local v2, "pos":I
    :goto_14
    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .local v1, "idx":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_11

    .line 360
    add-int/lit8 v0, v0, 0x1

    .line 361
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int v2, v1, v3

    goto :goto_14
.end method

.method public static delete(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "inString"    # Ljava/lang/String;
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 401
    const-string v0, ""

    invoke-static {p0, p1, v0}, Lorg/springframework/util/StringUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static deleteAny(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "inString"    # Ljava/lang/String;
    .param p1, "charsToDelete"    # Ljava/lang/String;

    .prologue
    .line 412
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-static {p1}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_d

    .line 422
    .end local p0    # "inString":Ljava/lang/String;
    :cond_c
    :goto_c
    return-object p0

    .line 415
    .restart local p0    # "inString":Ljava/lang/String;
    :cond_d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 416
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_13
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_2a

    .line 417
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 418
    .local v0, "c":C
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_27

    .line 419
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 416
    :cond_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 422
    .end local v0    # "c":C
    :cond_2a
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_c
.end method

.method public static delimitedListToStringArray(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .registers 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "delimiter"    # Ljava/lang/String;

    .prologue
    .line 994
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/springframework/util/StringUtils;->delimitedListToStringArray(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static delimitedListToStringArray(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .registers 9
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "delimiter"    # Ljava/lang/String;
    .param p2, "charsToDelete"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 1011
    if-nez p0, :cond_6

    .line 1012
    new-array v4, v5, [Ljava/lang/String;

    .line 1035
    :goto_5
    return-object v4

    .line 1014
    :cond_6
    if-nez p1, :cond_e

    .line 1015
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    aput-object p0, v4, v5

    goto :goto_5

    .line 1017
    :cond_e
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1018
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v4, ""

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_32

    .line 1019
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1c
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_63

    .line 1020
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p2}, Lorg/springframework/util/StringUtils;->deleteAny(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1019
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c

    .line 1024
    .end local v1    # "i":I
    :cond_32
    const/4 v2, 0x0

    .line 1026
    .local v2, "pos":I
    :goto_33
    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .local v0, "delPos":I
    const/4 v4, -0x1

    if-eq v0, v4, :cond_4c

    .line 1027
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p2}, Lorg/springframework/util/StringUtils;->deleteAny(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1028
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int v2, v0, v4

    goto :goto_33

    .line 1030
    :cond_4c
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_63

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-gt v2, v4, :cond_63

    .line 1032
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p2}, Lorg/springframework/util/StringUtils;->deleteAny(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1035
    .end local v0    # "delPos":I
    .end local v2    # "pos":I
    :cond_63
    invoke-static {v3}, Lorg/springframework/util/StringUtils;->toStringArray(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v4

    goto :goto_5
.end method

.method public static endsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 7
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 315
    if-eqz p0, :cond_5

    if-nez p1, :cond_6

    .line 327
    :cond_5
    :goto_5
    return v2

    .line 318
    :cond_6
    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 319
    const/4 v2, 0x1

    goto :goto_5

    .line 321
    :cond_e
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v3, v4, :cond_5

    .line 325
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 326
    .local v0, "lcStr":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 327
    .local v1, "lcSuffix":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_5
.end method

.method public static getFilename(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 514
    if-nez p0, :cond_4

    .line 515
    const/4 p0, 0x0

    .line 518
    .end local p0    # "path":Ljava/lang/String;
    .local v0, "separatorIndex":I
    :cond_3
    :goto_3
    return-object p0

    .line 517
    .end local v0    # "separatorIndex":I
    .restart local p0    # "path":Ljava/lang/String;
    :cond_4
    const-string v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 518
    .restart local v0    # "separatorIndex":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_3

    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_3
.end method

.method public static getFilenameExtension(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 528
    if-nez p0, :cond_4

    .line 539
    :cond_3
    :goto_3
    return-object v2

    .line 531
    :cond_4
    const/16 v3, 0x2e

    invoke-virtual {p0, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 532
    .local v0, "extIndex":I
    const/4 v3, -0x1

    if-eq v0, v3, :cond_3

    .line 535
    const-string v3, "/"

    invoke-virtual {p0, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 536
    .local v1, "folderIndex":I
    if-gt v1, v0, :cond_3

    .line 539
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_3
.end method

.method public static hasLength(Ljava/lang/CharSequence;)Z
    .registers 2
    .param p0, "str"    # Ljava/lang/CharSequence;

    .prologue
    .line 85
    if-eqz p0, :cond_a

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static hasLength(Ljava/lang/String;)Z
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public static hasText(Ljava/lang/CharSequence;)Z
    .registers 5
    .param p0, "str"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v2, 0x0

    .line 116
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 125
    :cond_7
    :goto_7
    return v2

    .line 119
    :cond_8
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 120
    .local v1, "strLen":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    if-ge v0, v1, :cond_7

    .line 121
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-nez v3, :cond_1b

    .line 122
    const/4 v2, 0x1

    goto :goto_7

    .line 120
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_d
.end method

.method public static hasText(Ljava/lang/String;)Z
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 138
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->hasText(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public static mergeStringArrays([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
    .registers 8
    .param p0, "array1"    # [Ljava/lang/String;
    .param p1, "array2"    # [Ljava/lang/String;

    .prologue
    .line 760
    invoke-static {p0}, Lorg/springframework/util/ObjectUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 773
    .end local p1    # "array2":[Ljava/lang/String;
    :goto_6
    return-object p1

    .line 763
    .restart local p1    # "array2":[Ljava/lang/String;
    :cond_7
    invoke-static {p1}, Lorg/springframework/util/ObjectUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f

    move-object p1, p0

    .line 764
    goto :goto_6

    .line 766
    :cond_f
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 767
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 768
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1e
    if-ge v1, v2, :cond_2e

    aget-object v4, v0, v1

    .line 769
    .local v4, "str":Ljava/lang/String;
    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2b

    .line 770
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 768
    :cond_2b
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    .line 773
    .end local v4    # "str":Ljava/lang/String;
    :cond_2e
    invoke-static {v3}, Lorg/springframework/util/StringUtils;->toStringArray(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object p1

    goto :goto_6
.end method

.method public static parseLocaleString(Ljava/lang/String;)Ljava/util/Locale;
    .registers 9
    .param p0, "localeString"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 667
    const-string v5, "_ "

    invoke-static {p0, v5, v6, v6}, Lorg/springframework/util/StringUtils;->tokenizeToStringArray(Ljava/lang/String;Ljava/lang/String;ZZ)[Ljava/lang/String;

    move-result-object v3

    .line 668
    .local v3, "parts":[Ljava/lang/String;
    array-length v5, v3

    if-lez v5, :cond_4a

    aget-object v2, v3, v6

    .line 669
    .local v2, "language":Ljava/lang/String;
    :goto_d
    array-length v5, v3

    if-le v5, v7, :cond_4d

    aget-object v0, v3, v7

    .line 670
    .local v0, "country":Ljava/lang/String;
    :goto_12
    invoke-static {v2}, Lorg/springframework/util/StringUtils;->validateLocalePart(Ljava/lang/String;)V

    .line 671
    invoke-static {v0}, Lorg/springframework/util/StringUtils;->validateLocalePart(Ljava/lang/String;)V

    .line 672
    const-string v4, ""

    .line 673
    .local v4, "variant":Ljava/lang/String;
    array-length v5, v3

    const/4 v6, 0x2

    if-lt v5, v6, :cond_3e

    .line 676
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    add-int v1, v5, v6

    .line 678
    .local v1, "endIndexOfCountryCode":I
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/springframework/util/StringUtils;->trimLeadingWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 679
    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3e

    .line 680
    const/16 v5, 0x5f

    invoke-static {v4, v5}, Lorg/springframework/util/StringUtils;->trimLeadingCharacter(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v4

    .line 683
    .end local v1    # "endIndexOfCountryCode":I
    :cond_3e
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_50

    new-instance v5, Ljava/util/Locale;

    invoke-direct {v5, v2, v0, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_49
    return-object v5

    .line 668
    .end local v0    # "country":Ljava/lang/String;
    .end local v2    # "language":Ljava/lang/String;
    .end local v4    # "variant":Ljava/lang/String;
    :cond_4a
    const-string v2, ""

    goto :goto_d

    .line 669
    .restart local v2    # "language":Ljava/lang/String;
    :cond_4d
    const-string v0, ""

    goto :goto_12

    .line 683
    .restart local v0    # "country":Ljava/lang/String;
    .restart local v4    # "variant":Ljava/lang/String;
    :cond_50
    const/4 v5, 0x0

    goto :goto_49
.end method

.method public static pathEquals(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p0, "path1"    # Ljava/lang/String;
    .param p1, "path2"    # Ljava/lang/String;

    .prologue
    .line 655
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->cleanPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lorg/springframework/util/StringUtils;->cleanPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static quote(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 437
    if-eqz p0, :cond_1c

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1b
    return-object v0

    :cond_1c
    const/4 v0, 0x0

    goto :goto_1b
.end method

.method public static quoteIfString(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 448
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_a

    check-cast p0, Ljava/lang/String;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_a
    return-object p0
.end method

.method public static removeDuplicateStrings([Ljava/lang/String;)[Ljava/lang/String;
    .registers 7
    .param p0, "array"    # [Ljava/lang/String;

    .prologue
    .line 843
    invoke-static {p0}, Lorg/springframework/util/ObjectUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 850
    .end local p0    # "array":[Ljava/lang/String;
    :goto_6
    return-object p0

    .line 846
    .restart local p0    # "array":[Ljava/lang/String;
    :cond_7
    new-instance v4, Ljava/util/TreeSet;

    invoke-direct {v4}, Ljava/util/TreeSet;-><init>()V

    .line 847
    .local v4, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_f
    if-ge v2, v3, :cond_19

    aget-object v1, v0, v2

    .line 848
    .local v1, "element":Ljava/lang/String;
    invoke-interface {v4, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 847
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 850
    .end local v1    # "element":Ljava/lang/String;
    :cond_19
    invoke-static {v4}, Lorg/springframework/util/StringUtils;->toStringArray(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object p0

    goto :goto_6
.end method

.method public static replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "inString"    # Ljava/lang/String;
    .param p1, "oldPattern"    # Ljava/lang/String;
    .param p2, "newPattern"    # Ljava/lang/String;

    .prologue
    .line 375
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_e

    invoke-static {p1}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_e

    if-nez p2, :cond_f

    .line 391
    .end local p0    # "inString":Ljava/lang/String;
    :cond_e
    :goto_e
    return-object p0

    .line 378
    .restart local p0    # "inString":Ljava/lang/String;
    :cond_f
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 379
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 380
    .local v2, "pos":I
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 382
    .local v0, "index":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 383
    .local v1, "patLen":I
    :goto_1d
    if-ltz v0, :cond_30

    .line 384
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 385
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    add-int v2, v0, v1

    .line 387
    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_1d

    .line 389
    :cond_30
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_e
.end method

.method public static sortStringArray([Ljava/lang/String;)[Ljava/lang/String;
    .registers 2
    .param p0, "array"    # [Ljava/lang/String;

    .prologue
    .line 782
    invoke-static {p0}, Lorg/springframework/util/ObjectUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 783
    const/4 v0, 0x0

    new-array p0, v0, [Ljava/lang/String;

    .line 786
    .end local p0    # "array":[Ljava/lang/String;
    :goto_9
    return-object p0

    .line 785
    .restart local p0    # "array":[Ljava/lang/String;
    :cond_a
    invoke-static {p0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    goto :goto_9
.end method

.method public static split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .registers 8
    .param p0, "toSplit"    # Ljava/lang/String;
    .param p1, "delimiter"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v5, 0x0

    .line 863
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_e

    invoke-static {p1}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_f

    .line 872
    :cond_e
    :goto_e
    return-object v3

    .line 866
    :cond_f
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 867
    .local v2, "offset":I
    if-ltz v2, :cond_e

    .line 870
    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 871
    .local v1, "beforeDelimiter":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v2

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 872
    .local v0, "afterDelimiter":Ljava/lang/String;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    aput-object v1, v3, v5

    const/4 v4, 0x1

    aput-object v0, v3, v4

    goto :goto_e
.end method

.method public static splitArrayElementsIntoProperties([Ljava/lang/String;Ljava/lang/String;)Ljava/util/Properties;
    .registers 3
    .param p0, "array"    # [Ljava/lang/String;
    .param p1, "delimiter"    # Ljava/lang/String;

    .prologue
    .line 887
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/springframework/util/StringUtils;->splitArrayElementsIntoProperties([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Properties;

    move-result-object v0

    return-object v0
.end method

.method public static splitArrayElementsIntoProperties([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Properties;
    .registers 11
    .param p0, "array"    # [Ljava/lang/String;
    .param p1, "delimiter"    # Ljava/lang/String;
    .param p2, "charsToDelete"    # Ljava/lang/String;

    .prologue
    .line 907
    invoke-static {p0}, Lorg/springframework/util/ObjectUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 908
    const/4 v4, 0x0

    .line 921
    :cond_7
    return-object v4

    .line 910
    :cond_8
    new-instance v4, Ljava/util/Properties;

    invoke-direct {v4}, Ljava/util/Properties;-><init>()V

    .line 911
    .local v4, "result":Ljava/util/Properties;
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_10
    if-ge v2, v3, :cond_7

    aget-object v1, v0, v2

    .line 912
    .local v1, "element":Ljava/lang/String;
    if-eqz p2, :cond_1a

    .line 913
    invoke-static {v1, p2}, Lorg/springframework/util/StringUtils;->deleteAny(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 915
    :cond_1a
    invoke-static {v1, p1}, Lorg/springframework/util/StringUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 916
    .local v5, "splittedElement":[Ljava/lang/String;
    if-nez v5, :cond_23

    .line 911
    :goto_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 919
    :cond_23
    const/4 v6, 0x0

    aget-object v6, v5, v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    aget-object v7, v5, v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    goto :goto_20
.end method

.method public static startsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 7
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 293
    if-eqz p0, :cond_5

    if-nez p1, :cond_6

    .line 304
    :cond_5
    :goto_5
    return v2

    .line 296
    :cond_6
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 297
    const/4 v2, 0x1

    goto :goto_5

    .line 299
    :cond_e
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v3, v4, :cond_5

    .line 302
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 303
    .local v1, "lcStr":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 304
    .local v0, "lcPrefix":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_5
.end method

.method public static stripFilenameExtension(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 550
    if-nez p0, :cond_4

    .line 551
    const/4 p0, 0x0

    .line 561
    .end local p0    # "path":Ljava/lang/String;
    .local v0, "extIndex":I
    :cond_3
    :goto_3
    return-object p0

    .line 553
    .end local v0    # "extIndex":I
    .restart local p0    # "path":Ljava/lang/String;
    :cond_4
    const/16 v2, 0x2e

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 554
    .restart local v0    # "extIndex":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_3

    .line 557
    const-string v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 558
    .local v1, "folderIndex":I
    if-gt v1, v0, :cond_3

    .line 561
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_3
.end method

.method public static substringMatch(Ljava/lang/CharSequence;ILjava/lang/CharSequence;)Z
    .registers 7
    .param p0, "str"    # Ljava/lang/CharSequence;
    .param p1, "index"    # I
    .param p2, "substring"    # Ljava/lang/CharSequence;

    .prologue
    .line 338
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ge v1, v2, :cond_1e

    .line 339
    add-int v0, p1, v1

    .line 340
    .local v0, "i":I
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ge v0, v2, :cond_19

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-interface {p2, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_1b

    .line 341
    :cond_19
    const/4 v2, 0x0

    .line 344
    .end local v0    # "i":I
    :goto_1a
    return v2

    .line 338
    .restart local v0    # "i":I
    :cond_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 344
    .end local v0    # "i":I
    :cond_1e
    const/4 v2, 0x1

    goto :goto_1a
.end method

.method public static toLanguageTag(Ljava/util/Locale;)Ljava/lang/String;
    .registers 4
    .param p0, "locale"    # Ljava/util/Locale;

    .prologue
    .line 703
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/springframework/util/StringUtils;->hasText(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_37

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "-"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2e
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_37
    const-string v0, ""

    goto :goto_2e
.end method

.method public static toStringArray(Ljava/util/Collection;)[Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 797
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    if-nez p0, :cond_4

    .line 798
    const/4 v0, 0x0

    .line 800
    :goto_3
    return-object v0

    :cond_4
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p0, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    goto :goto_3
.end method

.method public static toStringArray(Ljava/util/Enumeration;)[Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Enumeration",
            "<",
            "Ljava/lang/String;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 811
    .local p0, "enumeration":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    if-nez p0, :cond_4

    .line 812
    const/4 v1, 0x0

    .line 815
    :goto_3
    return-object v1

    .line 814
    :cond_4
    invoke-static {p0}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v0

    .line 815
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    goto :goto_3
.end method

.method public static tokenizeToStringArray(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .registers 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "delimiters"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 940
    invoke-static {p0, p1, v0, v0}, Lorg/springframework/util/StringUtils;->tokenizeToStringArray(Ljava/lang/String;Ljava/lang/String;ZZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static tokenizeToStringArray(Ljava/lang/String;Ljava/lang/String;ZZ)[Ljava/lang/String;
    .registers 8
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "delimiters"    # Ljava/lang/String;
    .param p2, "trimTokens"    # Z
    .param p3, "ignoreEmptyTokens"    # Z

    .prologue
    .line 965
    if-nez p0, :cond_4

    .line 966
    const/4 v3, 0x0

    .line 979
    :goto_3
    return-object v3

    .line 968
    :cond_4
    new-instance v0, Ljava/util/StringTokenizer;

    invoke-direct {v0, p0, p1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 969
    .local v0, "st":Ljava/util/StringTokenizer;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 970
    .local v2, "tokens":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_e
    :goto_e
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 971
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 972
    .local v1, "token":Ljava/lang/String;
    if-eqz p2, :cond_1e

    .line 973
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 975
    :cond_1e
    if-eqz p3, :cond_26

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_e

    .line 976
    :cond_26
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 979
    .end local v1    # "token":Ljava/lang/String;
    :cond_2a
    invoke-static {v2}, Lorg/springframework/util/StringUtils;->toStringArray(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v3

    goto :goto_3
.end method

.method public static trimAllWhitespace(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 200
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 213
    .end local p0    # "str":Ljava/lang/String;
    :goto_6
    return-object p0

    .line 203
    .restart local p0    # "str":Ljava/lang/String;
    :cond_7
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 204
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 205
    .local v0, "index":I
    :goto_d
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-le v2, v0, :cond_24

    .line 206
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 207
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    goto :goto_d

    .line 210
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 213
    :cond_24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_6
.end method

.method public static trimArrayElements([Ljava/lang/String;)[Ljava/lang/String;
    .registers 5
    .param p0, "array"    # [Ljava/lang/String;

    .prologue
    .line 825
    invoke-static {p0}, Lorg/springframework/util/ObjectUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 826
    const/4 v3, 0x0

    new-array v2, v3, [Ljava/lang/String;

    .line 833
    :cond_9
    return-object v2

    .line 828
    :cond_a
    array-length v3, p0

    new-array v2, v3, [Ljava/lang/String;

    .line 829
    .local v2, "result":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    array-length v3, p0

    if-ge v1, v3, :cond_9

    .line 830
    aget-object v0, p0, v1

    .line 831
    .local v0, "element":Ljava/lang/String;
    if-eqz v0, :cond_1e

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    :goto_19
    aput-object v3, v2, v1

    .line 829
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 831
    :cond_1e
    const/4 v3, 0x0

    goto :goto_19
.end method

.method public static trimLeadingCharacter(Ljava/lang/String;C)Ljava/lang/String;
    .registers 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "leadingCharacter"    # C

    .prologue
    const/4 v2, 0x0

    .line 257
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 264
    .end local p0    # "str":Ljava/lang/String;
    :goto_7
    return-object p0

    .line 260
    .restart local p0    # "str":Ljava/lang/String;
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 261
    .local v0, "sb":Ljava/lang/StringBuilder;
    :goto_d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_1d

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    if-ne v1, p1, :cond_1d

    .line 262
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    goto :goto_d

    .line 264
    :cond_1d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_7
.end method

.method public static trimLeadingWhitespace(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 223
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 230
    .end local p0    # "str":Ljava/lang/String;
    :goto_7
    return-object p0

    .line 226
    .restart local p0    # "str":Ljava/lang/String;
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 227
    .local v0, "sb":Ljava/lang/StringBuilder;
    :goto_d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_21

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 228
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    goto :goto_d

    .line 230
    :cond_21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_7
.end method

.method public static trimTrailingCharacter(Ljava/lang/String;C)Ljava/lang/String;
    .registers 4
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "trailingCharacter"    # C

    .prologue
    .line 274
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 281
    .end local p0    # "str":Ljava/lang/String;
    :goto_6
    return-object p0

    .line 277
    .restart local p0    # "str":Ljava/lang/String;
    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 278
    .local v0, "sb":Ljava/lang/StringBuilder;
    :goto_c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_28

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    if-ne v1, p1, :cond_28

    .line 279
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    goto :goto_c

    .line 281
    :cond_28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_6
.end method

.method public static trimTrailingWhitespace(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 240
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 247
    .end local p0    # "str":Ljava/lang/String;
    :goto_6
    return-object p0

    .line 243
    .restart local p0    # "str":Ljava/lang/String;
    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 244
    .local v0, "sb":Ljava/lang/StringBuilder;
    :goto_c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_2c

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-eqz v1, :cond_2c

    .line 245
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    goto :goto_c

    .line 247
    :cond_2c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_6
.end method

.method public static trimWhitespace(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 179
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->hasLength(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 189
    .end local p0    # "str":Ljava/lang/String;
    :goto_7
    return-object p0

    .line 182
    .restart local p0    # "str":Ljava/lang/String;
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 183
    .local v0, "sb":Ljava/lang/StringBuilder;
    :goto_d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_21

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 184
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    goto :goto_d

    .line 186
    :cond_21
    :goto_21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_41

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-eqz v1, :cond_41

    .line 187
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    goto :goto_21

    .line 189
    :cond_41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_7
.end method

.method public static uncapitalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 489
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/springframework/util/StringUtils;->changeFirstCharacterCase(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unqualify(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "qualifiedName"    # Ljava/lang/String;

    .prologue
    .line 457
    const/16 v0, 0x2e

    invoke-static {p0, v0}, Lorg/springframework/util/StringUtils;->unqualify(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unqualify(Ljava/lang/String;C)Ljava/lang/String;
    .registers 3
    .param p0, "qualifiedName"    # Ljava/lang/String;
    .param p1, "separator"    # C

    .prologue
    .line 467
    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static validateLocalePart(Ljava/lang/String;)V
    .registers 6
    .param p0, "localePart"    # Ljava/lang/String;

    .prologue
    .line 687
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_3b

    .line 688
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 689
    .local v0, "ch":C
    const/16 v2, 0x5f

    if-eq v0, v2, :cond_38

    const/16 v2, 0x20

    if-eq v0, v2, :cond_38

    invoke-static {v0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v2

    if-nez v2, :cond_38

    .line 690
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Locale part \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\" contains invalid characters"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 687
    :cond_38
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 694
    .end local v0    # "ch":C
    :cond_3b
    return-void
.end method
