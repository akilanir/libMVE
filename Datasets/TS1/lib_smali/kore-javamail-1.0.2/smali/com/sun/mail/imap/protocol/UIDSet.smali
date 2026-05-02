.class public Lcom/sun/mail/imap/protocol/UIDSet;
.super Ljava/lang/Object;
.source "UIDSet.java"


# instance fields
.field public end:J

.field public start:J


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(JJ)V
    .registers 5
    .param p1, "start"    # J
    .param p3, "end"    # J

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-wide p1, p0, Lcom/sun/mail/imap/protocol/UIDSet;->start:J

    .line 60
    iput-wide p3, p0, Lcom/sun/mail/imap/protocol/UIDSet;->end:J

    .line 61
    return-void
.end method

.method public static createUIDSets([J)[Lcom/sun/mail/imap/protocol/UIDSet;
    .registers 12
    .param p0, "uids"    # [J

    .prologue
    .line 74
    if-nez p0, :cond_4

    .line 75
    const/4 v5, 0x0

    .line 93
    :goto_3
    return-object v5

    .line 76
    :cond_4
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .local v4, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/UIDSet;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    array-length v5, p0

    if-ge v0, v5, :cond_39

    .line 80
    new-instance v2, Lcom/sun/mail/imap/protocol/UIDSet;

    invoke-direct {v2}, Lcom/sun/mail/imap/protocol/UIDSet;-><init>()V

    .line 81
    .local v2, "ms":Lcom/sun/mail/imap/protocol/UIDSet;
    aget-wide v5, p0, v0

    iput-wide v5, v2, Lcom/sun/mail/imap/protocol/UIDSet;->start:J

    .line 84
    add-int/lit8 v1, v0, 0x1

    .local v1, "j":I
    :goto_18
    array-length v5, p0

    if-ge v1, v5, :cond_28

    .line 85
    aget-wide v5, p0, v1

    add-int/lit8 v7, v1, -0x1

    aget-wide v7, p0, v7

    const-wide/16 v9, 0x1

    add-long/2addr v7, v9

    cmp-long v5, v5, v7

    if-eqz v5, :cond_36

    .line 88
    :cond_28
    add-int/lit8 v5, v1, -0x1

    aget-wide v5, p0, v5

    iput-wide v5, v2, Lcom/sun/mail/imap/protocol/UIDSet;->end:J

    .line 89
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    add-int/lit8 v0, v1, -0x1

    .line 79
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 84
    :cond_36
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    .line 92
    .end local v1    # "j":I
    .end local v2    # "ms":Lcom/sun/mail/imap/protocol/UIDSet;
    :cond_39
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v3, v5, [Lcom/sun/mail/imap/protocol/UIDSet;

    .line 93
    .local v3, "uidset":[Lcom/sun/mail/imap/protocol/UIDSet;
    invoke-interface {v4, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcom/sun/mail/imap/protocol/UIDSet;

    goto :goto_3
.end method

.method public static parseUIDSets(Ljava/lang/String;)[Lcom/sun/mail/imap/protocol/UIDSet;
    .registers 13
    .param p0, "uids"    # Ljava/lang/String;

    .prologue
    .line 102
    if-nez p0, :cond_4

    .line 103
    const/4 v10, 0x0

    .line 131
    :goto_3
    return-object v10

    .line 104
    :cond_4
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 105
    .local v9, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/UIDSet;>;"
    new-instance v5, Ljava/util/StringTokenizer;

    const-string v10, ",:"

    const/4 v11, 0x1

    invoke-direct {v5, p0, v10, v11}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 106
    .local v5, "st":Ljava/util/StringTokenizer;
    const-wide/16 v6, -0x1

    .line 107
    .local v6, "start":J
    const/4 v0, 0x0

    .local v0, "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    move-object v1, v0

    .line 109
    .end local v0    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    .local v1, "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    :goto_15
    :try_start_15
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v10

    if-eqz v10, :cond_4a

    .line 110
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    .line 111
    .local v4, "s":Ljava/lang/String;
    const-string v10, ","

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2f

    .line 112
    if-eqz v1, :cond_2c

    .line 113
    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    :cond_2c
    const/4 v0, 0x0

    .end local v1    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    .restart local v0    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    :goto_2d
    move-object v1, v0

    .line 124
    .end local v0    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    .restart local v1    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    goto :goto_15

    .line 115
    :cond_2f
    const-string v10, ":"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_39

    move-object v0, v1

    .end local v1    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    .restart local v0    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    goto :goto_2d

    .line 118
    .end local v0    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    .restart local v1    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    :cond_39
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 119
    .local v2, "n":J
    if-eqz v1, :cond_43

    .line 120
    iput-wide v2, v1, Lcom/sun/mail/imap/protocol/UIDSet;->end:J

    move-object v0, v1

    .end local v1    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    .restart local v0    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    goto :goto_2d

    .line 122
    .end local v0    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    .restart local v1    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    :cond_43
    new-instance v0, Lcom/sun/mail/imap/protocol/UIDSet;

    invoke-direct {v0, v2, v3, v2, v3}, Lcom/sun/mail/imap/protocol/UIDSet;-><init>(JJ)V
    :try_end_48
    .catch Ljava/lang/NumberFormatException; {:try_start_15 .. :try_end_48} :catch_49

    .end local v1    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    .restart local v0    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    goto :goto_2d

    .line 125
    .end local v0    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    .end local v2    # "n":J
    .end local v4    # "s":Ljava/lang/String;
    .restart local v1    # "cur":Lcom/sun/mail/imap/protocol/UIDSet;
    :catch_49
    move-exception v10

    .line 128
    :cond_4a
    if-eqz v1, :cond_4f

    .line 129
    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    :cond_4f
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    new-array v8, v10, [Lcom/sun/mail/imap/protocol/UIDSet;

    .line 131
    .local v8, "uidset":[Lcom/sun/mail/imap/protocol/UIDSet;
    invoke-interface {v9, v8}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Lcom/sun/mail/imap/protocol/UIDSet;

    goto :goto_3
.end method

.method public static size([Lcom/sun/mail/imap/protocol/UIDSet;)J
    .registers 8
    .param p0, "uidset"    # [Lcom/sun/mail/imap/protocol/UIDSet;

    .prologue
    .line 209
    const-wide/16 v0, 0x0

    .line 211
    .local v0, "count":J
    if-eqz p0, :cond_12

    .line 212
    array-length v4, p0

    const/4 v3, 0x0

    :goto_6
    if-ge v3, v4, :cond_12

    aget-object v2, p0, v3

    .line 213
    .local v2, "u":Lcom/sun/mail/imap/protocol/UIDSet;
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/UIDSet;->size()J

    move-result-wide v5

    add-long/2addr v0, v5

    .line 212
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 215
    .end local v2    # "u":Lcom/sun/mail/imap/protocol/UIDSet;
    :cond_12
    return-wide v0
.end method

.method private static size([Lcom/sun/mail/imap/protocol/UIDSet;J)J
    .registers 14
    .param p0, "uidset"    # [Lcom/sun/mail/imap/protocol/UIDSet;
    .param p1, "uidmax"    # J

    .prologue
    const-wide/16 v9, 0x1

    .line 225
    const-wide/16 v0, 0x0

    .line 227
    .local v0, "count":J
    if-eqz p0, :cond_35

    .line 228
    array-length v4, p0

    const/4 v3, 0x0

    :goto_8
    if-ge v3, v4, :cond_35

    aget-object v2, p0, v3

    .line 229
    .local v2, "u":Lcom/sun/mail/imap/protocol/UIDSet;
    const-wide/16 v5, 0x0

    cmp-long v5, p1, v5

    if-gez v5, :cond_1a

    .line 230
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/UIDSet;->size()J

    move-result-wide v5

    add-long/2addr v0, v5

    .line 228
    :cond_17
    :goto_17
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 231
    :cond_1a
    iget-wide v5, v2, Lcom/sun/mail/imap/protocol/UIDSet;->start:J

    cmp-long v5, v5, p1

    if-gtz v5, :cond_17

    .line 232
    iget-wide v5, v2, Lcom/sun/mail/imap/protocol/UIDSet;->end:J

    cmp-long v5, v5, p1

    if-gez v5, :cond_2e

    .line 233
    iget-wide v5, v2, Lcom/sun/mail/imap/protocol/UIDSet;->end:J

    iget-wide v7, v2, Lcom/sun/mail/imap/protocol/UIDSet;->start:J

    sub-long/2addr v5, v7

    add-long/2addr v5, v9

    add-long/2addr v0, v5

    goto :goto_17

    .line 235
    :cond_2e
    iget-wide v5, v2, Lcom/sun/mail/imap/protocol/UIDSet;->start:J

    sub-long v5, p1, v5

    add-long/2addr v5, v9

    add-long/2addr v0, v5

    goto :goto_17

    .line 239
    .end local v2    # "u":Lcom/sun/mail/imap/protocol/UIDSet;
    :cond_35
    return-wide v0
.end method

.method public static toArray([Lcom/sun/mail/imap/protocol/UIDSet;)[J
    .registers 11
    .param p0, "uidset"    # [Lcom/sun/mail/imap/protocol/UIDSet;

    .prologue
    .line 173
    if-nez p0, :cond_4

    .line 174
    const/4 v5, 0x0

    .line 181
    :cond_3
    return-object v5

    .line 175
    :cond_4
    invoke-static {p0}, Lcom/sun/mail/imap/protocol/UIDSet;->size([Lcom/sun/mail/imap/protocol/UIDSet;)J

    move-result-wide v6

    long-to-int v6, v6

    new-array v5, v6, [J

    .line 176
    .local v5, "uids":[J
    const/4 v0, 0x0

    .line 177
    .local v0, "i":I
    array-length v7, p0

    const/4 v6, 0x0

    :goto_e
    if-ge v6, v7, :cond_3

    aget-object v4, p0, v6

    .line 178
    .local v4, "u":Lcom/sun/mail/imap/protocol/UIDSet;
    iget-wide v2, v4, Lcom/sun/mail/imap/protocol/UIDSet;->start:J

    .local v2, "n":J
    :goto_14
    iget-wide v8, v4, Lcom/sun/mail/imap/protocol/UIDSet;->end:J

    cmp-long v8, v2, v8

    if-gtz v8, :cond_23

    .line 179
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    aput-wide v2, v5, v0

    .line 178
    const-wide/16 v8, 0x1

    add-long/2addr v2, v8

    move v0, v1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_14

    .line 177
    :cond_23
    add-int/lit8 v6, v6, 0x1

    goto :goto_e
.end method

.method public static toArray([Lcom/sun/mail/imap/protocol/UIDSet;J)[J
    .registers 13
    .param p0, "uidset"    # [Lcom/sun/mail/imap/protocol/UIDSet;
    .param p1, "uidmax"    # J

    .prologue
    .line 191
    if-nez p0, :cond_4

    .line 192
    const/4 v5, 0x0

    .line 202
    :cond_3
    return-object v5

    .line 193
    :cond_4
    invoke-static {p0, p1, p2}, Lcom/sun/mail/imap/protocol/UIDSet;->size([Lcom/sun/mail/imap/protocol/UIDSet;J)J

    move-result-wide v6

    long-to-int v6, v6

    new-array v5, v6, [J

    .line 194
    .local v5, "uids":[J
    const/4 v0, 0x0

    .line 195
    .local v0, "i":I
    array-length v7, p0

    const/4 v6, 0x0

    :goto_e
    if-ge v6, v7, :cond_3

    aget-object v4, p0, v6

    .line 196
    .local v4, "u":Lcom/sun/mail/imap/protocol/UIDSet;
    iget-wide v2, v4, Lcom/sun/mail/imap/protocol/UIDSet;->start:J

    .local v2, "n":J
    :goto_14
    iget-wide v8, v4, Lcom/sun/mail/imap/protocol/UIDSet;->end:J

    cmp-long v8, v2, v8

    if-gtz v8, :cond_24

    .line 197
    const-wide/16 v8, 0x0

    cmp-long v8, p1, v8

    if-ltz v8, :cond_27

    cmp-long v8, v2, p1

    if-lez v8, :cond_27

    .line 195
    :cond_24
    add-int/lit8 v6, v6, 0x1

    goto :goto_e

    .line 199
    :cond_27
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    aput-wide v2, v5, v0

    .line 196
    const-wide/16 v8, 0x1

    add-long/2addr v2, v8

    move v0, v1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_14
.end method

.method public static toString([Lcom/sun/mail/imap/protocol/UIDSet;)Ljava/lang/String;
    .registers 10
    .param p0, "uidset"    # [Lcom/sun/mail/imap/protocol/UIDSet;

    .prologue
    .line 138
    if-nez p0, :cond_4

    .line 139
    const/4 v7, 0x0

    .line 163
    :goto_3
    return-object v7

    .line 140
    :cond_4
    array-length v7, p0

    if-nez v7, :cond_a

    .line 141
    const-string v7, ""

    goto :goto_3

    .line 143
    :cond_a
    const/4 v2, 0x0

    .line 144
    .local v2, "i":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 145
    .local v3, "s":Ljava/lang/StringBuilder;
    array-length v4, p0

    .line 149
    .local v4, "size":I
    :goto_11
    aget-object v7, p0, v2

    iget-wide v5, v7, Lcom/sun/mail/imap/protocol/UIDSet;->start:J

    .line 150
    .local v5, "start":J
    aget-object v7, p0, v2

    iget-wide v0, v7, Lcom/sun/mail/imap/protocol/UIDSet;->end:J

    .line 152
    .local v0, "end":J
    cmp-long v7, v0, v5

    if-lez v7, :cond_33

    .line 153
    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x3a

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 157
    :goto_2a
    add-int/lit8 v2, v2, 0x1

    .line 158
    if-lt v2, v4, :cond_37

    .line 163
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_3

    .line 155
    :cond_33
    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    goto :goto_2a

    .line 161
    :cond_37
    const/16 v7, 0x2c

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_11
.end method


# virtual methods
.method public size()J
    .registers 5

    .prologue
    .line 67
    iget-wide v0, p0, Lcom/sun/mail/imap/protocol/UIDSet;->end:J

    iget-wide v2, p0, Lcom/sun/mail/imap/protocol/UIDSet;->start:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    return-wide v0
.end method
