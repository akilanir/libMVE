.class Lcom/google/common/collect/RegularImmutableBiMap;
.super Lcom/google/common/collect/ImmutableBiMap;
.source "RegularImmutableBiMap.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
    emulated = true
    serializable = true
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/RegularImmutableBiMap$InverseSerializedForm;,
        Lcom/google/common/collect/RegularImmutableBiMap$Inverse;,
        Lcom/google/common/collect/RegularImmutableBiMap$NonTerminalBiMapEntry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableBiMap",
        "<TK;TV;>;"
    }
.end annotation


# static fields
.field static final MAX_LOAD_FACTOR:D = 1.2


# instance fields
.field private final transient entries:[Lcom/google/common/collect/ImmutableMapEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/google/common/collect/ImmutableMapEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private final transient hashCode:I

.field private transient inverse:Lcom/google/common/collect/ImmutableBiMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableBiMap",
            "<TV;TK;>;"
        }
    .end annotation
.end field

.field private final transient keyTable:[Lcom/google/common/collect/ImmutableMapEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/google/common/collect/ImmutableMapEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private final transient mask:I

.field private final transient valueTable:[Lcom/google/common/collect/ImmutableMapEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/google/common/collect/ImmutableMapEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(I[Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry;)V
    .registers 26
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[",
            "Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lcom/google/common/collect/RegularImmutableBiMap;, "Lcom/google/common/collect/RegularImmutableBiMap<TK;TV;>;"
    .local p2, "entriesToAdd":[Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry;, "[Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry<**>;"
    invoke-direct/range {p0 .. p0}, Lcom/google/common/collect/ImmutableBiMap;-><init>()V

    .line 56
    const-wide v21, 0x3ff3333333333333L    # 1.2

    move/from16 v0, p1

    move-wide/from16 v1, v21

    invoke-static {v0, v1, v2}, Lcom/google/common/collect/Hashing;->closedTableSize(ID)I

    move-result v15

    .line 57
    .local v15, "tableSize":I
    add-int/lit8 v21, v15, -0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/collect/RegularImmutableBiMap;->mask:I

    .line 58
    invoke-static {v15}, Lcom/google/common/collect/RegularImmutableBiMap;->createEntryArray(I)[Lcom/google/common/collect/ImmutableMapEntry;

    move-result-object v11

    .line 59
    .local v11, "keyTable":[Lcom/google/common/collect/ImmutableMapEntry;, "[Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    invoke-static {v15}, Lcom/google/common/collect/RegularImmutableBiMap;->createEntryArray(I)[Lcom/google/common/collect/ImmutableMapEntry;

    move-result-object v20

    .line 60
    .local v20, "valueTable":[Lcom/google/common/collect/ImmutableMapEntry;, "[Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    invoke-static/range {p1 .. p1}, Lcom/google/common/collect/RegularImmutableBiMap;->createEntryArray(I)[Lcom/google/common/collect/ImmutableMapEntry;

    move-result-object v3

    .line 61
    .local v3, "entries":[Lcom/google/common/collect/ImmutableMapEntry;, "[Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    const/4 v5, 0x0

    .line 63
    .local v5, "hashCode":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_26
    move/from16 v0, p1

    if-ge v6, v0, :cond_ba

    .line 65
    aget-object v4, p2, v6

    .line 66
    .local v4, "entry":Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry;, "Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry<TK;TV;>;"
    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry;->getKey()Ljava/lang/Object;

    move-result-object v7

    .line 67
    .local v7, "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry;->getValue()Ljava/lang/Object;

    move-result-object v16

    .line 69
    .local v16, "value":Ljava/lang/Object;, "TV;"
    invoke-virtual {v7}, Ljava/lang/Object;->hashCode()I

    move-result v10

    .line 70
    .local v10, "keyHash":I
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->hashCode()I

    move-result v19

    .line 71
    .local v19, "valueHash":I
    invoke-static {v10}, Lcom/google/common/collect/Hashing;->smear(I)I

    move-result v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/common/collect/RegularImmutableBiMap;->mask:I

    move/from16 v22, v0

    and-int v8, v21, v22

    .line 72
    .local v8, "keyBucket":I
    invoke-static/range {v19 .. v19}, Lcom/google/common/collect/Hashing;->smear(I)I

    move-result v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/common/collect/RegularImmutableBiMap;->mask:I

    move/from16 v22, v0

    and-int v17, v21, v22

    .line 74
    .local v17, "valueBucket":I
    aget-object v13, v11, v8

    .line 75
    .local v13, "nextInKeyBucket":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    move-object v9, v13

    .local v9, "keyEntry":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    :goto_57
    if-eqz v9, :cond_78

    .line 77
    invoke-virtual {v9}, Lcom/google/common/collect/ImmutableMapEntry;->getKey()Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v7, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_75

    const/16 v21, 0x1

    :goto_67
    const-string v22, "key"

    move/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v4, v9}, Lcom/google/common/collect/RegularImmutableBiMap;->checkNoConflict(ZLjava/lang/String;Ljava/util/Map$Entry;Ljava/util/Map$Entry;)V

    .line 76
    invoke-virtual {v9}, Lcom/google/common/collect/ImmutableMapEntry;->getNextInKeyBucket()Lcom/google/common/collect/ImmutableMapEntry;

    move-result-object v9

    goto :goto_57

    .line 77
    :cond_75
    const/16 v21, 0x0

    goto :goto_67

    .line 79
    :cond_78
    aget-object v14, v20, v17

    .line 80
    .local v14, "nextInValueBucket":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    move-object/from16 v18, v14

    .local v18, "valueEntry":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    :goto_7c
    if-eqz v18, :cond_a1

    .line 82
    invoke-virtual/range {v18 .. v18}, Lcom/google/common/collect/ImmutableMapEntry;->getValue()Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_9e

    const/16 v21, 0x1

    :goto_8e
    const-string v22, "value"

    move/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v18

    invoke-static {v0, v1, v4, v2}, Lcom/google/common/collect/RegularImmutableBiMap;->checkNoConflict(ZLjava/lang/String;Ljava/util/Map$Entry;Ljava/util/Map$Entry;)V

    .line 81
    invoke-virtual/range {v18 .. v18}, Lcom/google/common/collect/ImmutableMapEntry;->getNextInValueBucket()Lcom/google/common/collect/ImmutableMapEntry;

    move-result-object v18

    goto :goto_7c

    .line 82
    :cond_9e
    const/16 v21, 0x0

    goto :goto_8e

    .line 84
    :cond_a1
    if-nez v13, :cond_b4

    if-nez v14, :cond_b4

    move-object v12, v4

    .line 88
    .local v12, "newEntry":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    :goto_a6
    aput-object v12, v11, v8

    .line 89
    aput-object v12, v20, v17

    .line 90
    aput-object v12, v3, v6

    .line 91
    xor-int v21, v10, v19

    add-int v5, v5, v21

    .line 63
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_26

    .line 84
    .end local v12    # "newEntry":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    :cond_b4
    new-instance v12, Lcom/google/common/collect/RegularImmutableBiMap$NonTerminalBiMapEntry;

    invoke-direct {v12, v4, v13, v14}, Lcom/google/common/collect/RegularImmutableBiMap$NonTerminalBiMapEntry;-><init>(Lcom/google/common/collect/ImmutableMapEntry;Lcom/google/common/collect/ImmutableMapEntry;Lcom/google/common/collect/ImmutableMapEntry;)V

    goto :goto_a6

    .line 94
    .end local v4    # "entry":Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry;, "Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry<TK;TV;>;"
    .end local v7    # "key":Ljava/lang/Object;, "TK;"
    .end local v8    # "keyBucket":I
    .end local v9    # "keyEntry":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    .end local v10    # "keyHash":I
    .end local v13    # "nextInKeyBucket":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    .end local v14    # "nextInValueBucket":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    .end local v16    # "value":Ljava/lang/Object;, "TV;"
    .end local v17    # "valueBucket":I
    .end local v18    # "valueEntry":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    .end local v19    # "valueHash":I
    :cond_ba
    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/google/common/collect/RegularImmutableBiMap;->keyTable:[Lcom/google/common/collect/ImmutableMapEntry;

    .line 95
    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/common/collect/RegularImmutableBiMap;->valueTable:[Lcom/google/common/collect/ImmutableMapEntry;

    .line 96
    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/common/collect/RegularImmutableBiMap;->entries:[Lcom/google/common/collect/ImmutableMapEntry;

    .line 97
    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/common/collect/RegularImmutableBiMap;->hashCode:I

    .line 98
    return-void
.end method

.method varargs constructor <init>([Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, "this":Lcom/google/common/collect/RegularImmutableBiMap;, "Lcom/google/common/collect/RegularImmutableBiMap<TK;TV;>;"
    .local p1, "entriesToAdd":[Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry;, "[Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry<**>;"
    array-length v0, p1

    invoke-direct {p0, v0, p1}, Lcom/google/common/collect/RegularImmutableBiMap;-><init>(I[Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry;)V

    .line 47
    return-void
.end method

.method constructor <init>([Ljava/util/Map$Entry;)V
    .registers 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/util/Map$Entry",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p0, "this":Lcom/google/common/collect/RegularImmutableBiMap;, "Lcom/google/common/collect/RegularImmutableBiMap<TK;TV;>;"
    .local p1, "entriesToAdd":[Ljava/util/Map$Entry;, "[Ljava/util/Map$Entry<**>;"
    invoke-direct/range {p0 .. p0}, Lcom/google/common/collect/ImmutableBiMap;-><init>()V

    .line 104
    move-object/from16 v0, p1

    array-length v12, v0

    .line 105
    .local v12, "n":I
    const-wide v22, 0x3ff3333333333333L    # 1.2

    move-wide/from16 v0, v22

    invoke-static {v12, v0, v1}, Lcom/google/common/collect/Hashing;->closedTableSize(ID)I

    move-result v16

    .line 106
    .local v16, "tableSize":I
    add-int/lit8 v22, v16, -0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/collect/RegularImmutableBiMap;->mask:I

    .line 107
    invoke-static/range {v16 .. v16}, Lcom/google/common/collect/RegularImmutableBiMap;->createEntryArray(I)[Lcom/google/common/collect/ImmutableMapEntry;

    move-result-object v11

    .line 108
    .local v11, "keyTable":[Lcom/google/common/collect/ImmutableMapEntry;, "[Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    invoke-static/range {v16 .. v16}, Lcom/google/common/collect/RegularImmutableBiMap;->createEntryArray(I)[Lcom/google/common/collect/ImmutableMapEntry;

    move-result-object v21

    .line 109
    .local v21, "valueTable":[Lcom/google/common/collect/ImmutableMapEntry;, "[Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    invoke-static {v12}, Lcom/google/common/collect/RegularImmutableBiMap;->createEntryArray(I)[Lcom/google/common/collect/ImmutableMapEntry;

    move-result-object v3

    .line 110
    .local v3, "entries":[Lcom/google/common/collect/ImmutableMapEntry;, "[Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    const/4 v5, 0x0

    .line 112
    .local v5, "hashCode":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_27
    if-ge v6, v12, :cond_c6

    .line 114
    aget-object v4, p1, v6

    .line 115
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    .line 116
    .local v7, "key":Ljava/lang/Object;, "TK;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v17

    .line 117
    .local v17, "value":Ljava/lang/Object;, "TV;"
    move-object/from16 v0, v17

    invoke-static {v7, v0}, Lcom/google/common/collect/CollectPreconditions;->checkEntryNotNull(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 118
    invoke-virtual {v7}, Ljava/lang/Object;->hashCode()I

    move-result v10

    .line 119
    .local v10, "keyHash":I
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->hashCode()I

    move-result v20

    .line 120
    .local v20, "valueHash":I
    invoke-static {v10}, Lcom/google/common/collect/Hashing;->smear(I)I

    move-result v22

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/common/collect/RegularImmutableBiMap;->mask:I

    move/from16 v23, v0

    and-int v8, v22, v23

    .line 121
    .local v8, "keyBucket":I
    invoke-static/range {v20 .. v20}, Lcom/google/common/collect/Hashing;->smear(I)I

    move-result v22

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/common/collect/RegularImmutableBiMap;->mask:I

    move/from16 v23, v0

    and-int v18, v22, v23

    .line 123
    .local v18, "valueBucket":I
    aget-object v14, v11, v8

    .line 124
    .local v14, "nextInKeyBucket":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    move-object v9, v14

    .local v9, "keyEntry":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    :goto_5b
    if-eqz v9, :cond_7c

    .line 126
    invoke-virtual {v9}, Lcom/google/common/collect/ImmutableMapEntry;->getKey()Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_79

    const/16 v22, 0x1

    :goto_6b
    const-string v23, "key"

    move/from16 v0, v22

    move-object/from16 v1, v23

    invoke-static {v0, v1, v4, v9}, Lcom/google/common/collect/RegularImmutableBiMap;->checkNoConflict(ZLjava/lang/String;Ljava/util/Map$Entry;Ljava/util/Map$Entry;)V

    .line 125
    invoke-virtual {v9}, Lcom/google/common/collect/ImmutableMapEntry;->getNextInKeyBucket()Lcom/google/common/collect/ImmutableMapEntry;

    move-result-object v9

    goto :goto_5b

    .line 126
    :cond_79
    const/16 v22, 0x0

    goto :goto_6b

    .line 128
    :cond_7c
    aget-object v15, v21, v18

    .line 129
    .local v15, "nextInValueBucket":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    move-object/from16 v19, v15

    .local v19, "valueEntry":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    :goto_80
    if-eqz v19, :cond_a5

    .line 131
    invoke-virtual/range {v19 .. v19}, Lcom/google/common/collect/ImmutableMapEntry;->getValue()Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_a2

    const/16 v22, 0x1

    :goto_92
    const-string v23, "value"

    move/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v19

    invoke-static {v0, v1, v4, v2}, Lcom/google/common/collect/RegularImmutableBiMap;->checkNoConflict(ZLjava/lang/String;Ljava/util/Map$Entry;Ljava/util/Map$Entry;)V

    .line 130
    invoke-virtual/range {v19 .. v19}, Lcom/google/common/collect/ImmutableMapEntry;->getNextInValueBucket()Lcom/google/common/collect/ImmutableMapEntry;

    move-result-object v19

    goto :goto_80

    .line 131
    :cond_a2
    const/16 v22, 0x0

    goto :goto_92

    .line 133
    :cond_a5
    if-nez v14, :cond_be

    if-nez v15, :cond_be

    new-instance v13, Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry;

    move-object/from16 v0, v17

    invoke-direct {v13, v7, v0}, Lcom/google/common/collect/ImmutableMapEntry$TerminalEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 137
    .local v13, "newEntry":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    :goto_b0
    aput-object v13, v11, v8

    .line 138
    aput-object v13, v21, v18

    .line 139
    aput-object v13, v3, v6

    .line 140
    xor-int v22, v10, v20

    add-int v5, v5, v22

    .line 112
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_27

    .line 133
    .end local v13    # "newEntry":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    :cond_be
    new-instance v13, Lcom/google/common/collect/RegularImmutableBiMap$NonTerminalBiMapEntry;

    move-object/from16 v0, v17

    invoke-direct {v13, v7, v0, v14, v15}, Lcom/google/common/collect/RegularImmutableBiMap$NonTerminalBiMapEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/common/collect/ImmutableMapEntry;Lcom/google/common/collect/ImmutableMapEntry;)V

    goto :goto_b0

    .line 143
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    .end local v7    # "key":Ljava/lang/Object;, "TK;"
    .end local v8    # "keyBucket":I
    .end local v9    # "keyEntry":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    .end local v10    # "keyHash":I
    .end local v14    # "nextInKeyBucket":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    .end local v15    # "nextInValueBucket":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    .end local v17    # "value":Ljava/lang/Object;, "TV;"
    .end local v18    # "valueBucket":I
    .end local v19    # "valueEntry":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    .end local v20    # "valueHash":I
    :cond_c6
    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/google/common/collect/RegularImmutableBiMap;->keyTable:[Lcom/google/common/collect/ImmutableMapEntry;

    .line 144
    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/common/collect/RegularImmutableBiMap;->valueTable:[Lcom/google/common/collect/ImmutableMapEntry;

    .line 145
    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/common/collect/RegularImmutableBiMap;->entries:[Lcom/google/common/collect/ImmutableMapEntry;

    .line 146
    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/common/collect/RegularImmutableBiMap;->hashCode:I

    .line 147
    return-void
.end method

.method static synthetic access$000(Lcom/google/common/collect/RegularImmutableBiMap;)[Lcom/google/common/collect/ImmutableMapEntry;
    .registers 2
    .param p0, "x0"    # Lcom/google/common/collect/RegularImmutableBiMap;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableBiMap;->entries:[Lcom/google/common/collect/ImmutableMapEntry;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/common/collect/RegularImmutableBiMap;)I
    .registers 2
    .param p0, "x0"    # Lcom/google/common/collect/RegularImmutableBiMap;

    .prologue
    .line 35
    iget v0, p0, Lcom/google/common/collect/RegularImmutableBiMap;->hashCode:I

    return v0
.end method

.method static synthetic access$300(Lcom/google/common/collect/RegularImmutableBiMap;)I
    .registers 2
    .param p0, "x0"    # Lcom/google/common/collect/RegularImmutableBiMap;

    .prologue
    .line 35
    iget v0, p0, Lcom/google/common/collect/RegularImmutableBiMap;->mask:I

    return v0
.end method

.method static synthetic access$400(Lcom/google/common/collect/RegularImmutableBiMap;)[Lcom/google/common/collect/ImmutableMapEntry;
    .registers 2
    .param p0, "x0"    # Lcom/google/common/collect/RegularImmutableBiMap;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableBiMap;->valueTable:[Lcom/google/common/collect/ImmutableMapEntry;

    return-object v0
.end method

.method private static createEntryArray(I)[Lcom/google/common/collect/ImmutableMapEntry;
    .registers 2
    .param p0, "length"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(I)[",
            "Lcom/google/common/collect/ImmutableMapEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 183
    new-array v0, p0, [Lcom/google/common/collect/ImmutableMapEntry;

    return-object v0
.end method


# virtual methods
.method createEntrySet()Lcom/google/common/collect/ImmutableSet;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 204
    .local p0, "this":Lcom/google/common/collect/RegularImmutableBiMap;, "Lcom/google/common/collect/RegularImmutableBiMap<TK;TV;>;"
    new-instance v0, Lcom/google/common/collect/RegularImmutableBiMap$1;

    invoke-direct {v0, p0}, Lcom/google/common/collect/RegularImmutableBiMap$1;-><init>(Lcom/google/common/collect/RegularImmutableBiMap;)V

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "key"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/collect/RegularImmutableBiMap;, "Lcom/google/common/collect/RegularImmutableBiMap<TK;TV;>;"
    const/4 v2, 0x0

    .line 189
    if-nez p1, :cond_4

    .line 199
    :cond_3
    :goto_3
    return-object v2

    .line 192
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Lcom/google/common/collect/Hashing;->smear(I)I

    move-result v3

    iget v4, p0, Lcom/google/common/collect/RegularImmutableBiMap;->mask:I

    and-int v0, v3, v4

    .line 193
    .local v0, "bucket":I
    iget-object v3, p0, Lcom/google/common/collect/RegularImmutableBiMap;->keyTable:[Lcom/google/common/collect/ImmutableMapEntry;

    aget-object v1, v3, v0

    .local v1, "entry":Lcom/google/common/collect/ImmutableMapEntry;, "Lcom/google/common/collect/ImmutableMapEntry<TK;TV;>;"
    :goto_14
    if-eqz v1, :cond_3

    .line 195
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMapEntry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_25

    .line 196
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMapEntry;->getValue()Ljava/lang/Object;

    move-result-object v2

    goto :goto_3

    .line 194
    :cond_25
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMapEntry;->getNextInKeyBucket()Lcom/google/common/collect/ImmutableMapEntry;

    move-result-object v1

    goto :goto_14
.end method

.method public bridge synthetic inverse()Lcom/google/common/collect/BiMap;
    .registers 2

    .prologue
    .line 33
    .local p0, "this":Lcom/google/common/collect/RegularImmutableBiMap;, "Lcom/google/common/collect/RegularImmutableBiMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableBiMap;->inverse()Lcom/google/common/collect/ImmutableBiMap;

    move-result-object v0

    return-object v0
.end method

.method public inverse()Lcom/google/common/collect/ImmutableBiMap;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableBiMap",
            "<TV;TK;>;"
        }
    .end annotation

    .prologue
    .line 246
    .local p0, "this":Lcom/google/common/collect/RegularImmutableBiMap;, "Lcom/google/common/collect/RegularImmutableBiMap<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableBiMap;->inverse:Lcom/google/common/collect/ImmutableBiMap;

    .line 247
    .local v0, "result":Lcom/google/common/collect/ImmutableBiMap;, "Lcom/google/common/collect/ImmutableBiMap<TV;TK;>;"
    if-nez v0, :cond_c

    new-instance v0, Lcom/google/common/collect/RegularImmutableBiMap$Inverse;

    .end local v0    # "result":Lcom/google/common/collect/ImmutableBiMap;, "Lcom/google/common/collect/ImmutableBiMap<TV;TK;>;"
    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/RegularImmutableBiMap$Inverse;-><init>(Lcom/google/common/collect/RegularImmutableBiMap;Lcom/google/common/collect/RegularImmutableBiMap$1;)V

    iput-object v0, p0, Lcom/google/common/collect/RegularImmutableBiMap;->inverse:Lcom/google/common/collect/ImmutableBiMap;

    :cond_c
    return-object v0
.end method

.method isPartialView()Z
    .registers 2

    .prologue
    .line 234
    .local p0, "this":Lcom/google/common/collect/RegularImmutableBiMap;, "Lcom/google/common/collect/RegularImmutableBiMap<TK;TV;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 239
    .local p0, "this":Lcom/google/common/collect/RegularImmutableBiMap;, "Lcom/google/common/collect/RegularImmutableBiMap<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableBiMap;->entries:[Lcom/google/common/collect/ImmutableMapEntry;

    array-length v0, v0

    return v0
.end method
