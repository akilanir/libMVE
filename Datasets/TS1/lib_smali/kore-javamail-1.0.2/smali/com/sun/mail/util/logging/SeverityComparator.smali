.class public Lcom/sun/mail/util/logging/SeverityComparator;
.super Ljava/lang/Object;
.source "SeverityComparator.java"

# interfaces
.implements Ljava/util/Comparator;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/util/logging/LogRecord;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final INSTANCE:Lcom/sun/mail/util/logging/SeverityComparator;

.field private static final serialVersionUID:J = -0x245dae569ea8fc5dL


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 101
    new-instance v0, Lcom/sun/mail/util/logging/SeverityComparator;

    invoke-direct {v0}, Lcom/sun/mail/util/logging/SeverityComparator;-><init>()V

    sput-object v0, Lcom/sun/mail/util/logging/SeverityComparator;->INSTANCE:Lcom/sun/mail/util/logging/SeverityComparator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private compare(JJ)I
    .registers 6
    .param p1, "x"    # J
    .param p3, "y"    # J

    .prologue
    .line 335
    cmp-long v0, p1, p3

    if-gez v0, :cond_6

    const/4 v0, -0x1

    :goto_5
    return v0

    :cond_6
    cmp-long v0, p1, p3

    if-lez v0, :cond_c

    const/4 v0, 0x1

    goto :goto_5

    :cond_c
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private compare(Ljava/util/logging/Level;Ljava/util/logging/Level;)I
    .registers 7
    .param p1, "a"    # Ljava/util/logging/Level;
    .param p2, "b"    # Ljava/util/logging/Level;

    .prologue
    .line 312
    if-ne p1, p2, :cond_4

    const/4 v0, 0x0

    :goto_3
    return v0

    :cond_4
    invoke-virtual {p1}, Ljava/util/logging/Level;->intValue()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p2}, Ljava/util/logging/Level;->intValue()I

    move-result v2

    int-to-long v2, v2

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/sun/mail/util/logging/SeverityComparator;->compare(JJ)I

    move-result v0

    goto :goto_3
.end method

.method static getInstance()Lcom/sun/mail/util/logging/SeverityComparator;
    .registers 1

    .prologue
    .line 110
    sget-object v0, Lcom/sun/mail/util/logging/SeverityComparator;->INSTANCE:Lcom/sun/mail/util/logging/SeverityComparator;

    return-object v0
.end method

.method private static toString(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .registers 4
    .param p0, "o1"    # Ljava/lang/Object;
    .param p1, "o2"    # Ljava/lang/Object;

    .prologue
    .line 323
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public apply(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .registers 8
    .param p1, "chain"    # Ljava/lang/Throwable;

    .prologue
    .line 126
    const/4 v2, 0x0

    .line 127
    .local v2, "limit":I
    move-object v4, p1

    .line 128
    .local v4, "root":Ljava/lang/Throwable;
    const/4 v1, 0x0

    .line 129
    .local v1, "high":Ljava/lang/Throwable;
    const/4 v3, 0x0

    .line 130
    .local v3, "normal":Ljava/lang/Throwable;
    move-object v0, p1

    .local v0, "cause":Ljava/lang/Throwable;
    :goto_5
    if-eqz v0, :cond_1c

    .line 131
    move-object v4, v0

    .line 134
    invoke-virtual {p0, v0}, Lcom/sun/mail/util/logging/SeverityComparator;->isNormal(Ljava/lang/Throwable;)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 135
    move-object v3, v0

    .line 139
    :cond_f
    if-nez v3, :cond_16

    instance-of v5, v0, Ljava/lang/Error;

    if-eqz v5, :cond_16

    .line 140
    move-object v1, v0

    .line 144
    :cond_16
    add-int/lit8 v2, v2, 0x1

    const/high16 v5, 0x10000

    if-ne v2, v5, :cond_1f

    .line 148
    :cond_1c
    if-eqz v1, :cond_24

    .end local v1    # "high":Ljava/lang/Throwable;
    :goto_1e
    return-object v1

    .line 130
    .restart local v1    # "high":Ljava/lang/Throwable;
    :cond_1f
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_5

    .line 148
    :cond_24
    if-eqz v3, :cond_28

    move-object v1, v3

    goto :goto_1e

    :cond_28
    move-object v1, v4

    goto :goto_1e
.end method

.method public final applyThenCompare(Ljava/lang/Throwable;Ljava/lang/Throwable;)I
    .registers 5
    .param p1, "tc1"    # Ljava/lang/Throwable;
    .param p2, "tc2"    # Ljava/lang/Throwable;

    .prologue
    .line 164
    if-ne p1, p2, :cond_4

    const/4 v0, 0x0

    :goto_3
    return v0

    :cond_4
    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/SeverityComparator;->apply(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v0

    invoke-virtual {p0, p2}, Lcom/sun/mail/util/logging/SeverityComparator;->apply(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/util/logging/SeverityComparator;->compareThrowable(Ljava/lang/Throwable;Ljava/lang/Throwable;)I

    move-result v0

    goto :goto_3
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .prologue
    .line 91
    check-cast p1, Ljava/util/logging/LogRecord;

    check-cast p2, Ljava/util/logging/LogRecord;

    invoke-virtual {p0, p1, p2}, Lcom/sun/mail/util/logging/SeverityComparator;->compare(Ljava/util/logging/LogRecord;Ljava/util/logging/LogRecord;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/util/logging/LogRecord;Ljava/util/logging/LogRecord;)I
    .registers 8
    .param p1, "o1"    # Ljava/util/logging/LogRecord;
    .param p2, "o2"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 231
    if-eqz p1, :cond_4

    if-nez p2, :cond_e

    .line 232
    :cond_4
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-static {p1, p2}, Lcom/sun/mail/util/logging/SeverityComparator;->toString(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 239
    :cond_e
    if-ne p1, p2, :cond_12

    .line 240
    const/4 v0, 0x0

    .line 253
    :cond_11
    :goto_11
    return v0

    .line 243
    :cond_12
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getLevel()Ljava/util/logging/Level;

    move-result-object v1

    invoke-virtual {p2}, Ljava/util/logging/LogRecord;->getLevel()Ljava/util/logging/Level;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/sun/mail/util/logging/SeverityComparator;->compare(Ljava/util/logging/Level;Ljava/util/logging/Level;)I

    move-result v0

    .line 244
    .local v0, "cmp":I
    if-nez v0, :cond_11

    .line 245
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getThrown()Ljava/lang/Throwable;

    move-result-object v1

    invoke-virtual {p2}, Ljava/util/logging/LogRecord;->getThrown()Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/sun/mail/util/logging/SeverityComparator;->applyThenCompare(Ljava/lang/Throwable;Ljava/lang/Throwable;)I

    move-result v0

    .line 246
    if-nez v0, :cond_11

    .line 247
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getSequenceNumber()J

    move-result-wide v1

    invoke-virtual {p2}, Ljava/util/logging/LogRecord;->getSequenceNumber()J

    move-result-wide v3

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/sun/mail/util/logging/SeverityComparator;->compare(JJ)I

    move-result v0

    .line 248
    if-nez v0, :cond_11

    .line 249
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getMillis()J

    move-result-wide v1

    invoke-virtual {p2}, Ljava/util/logging/LogRecord;->getMillis()J

    move-result-wide v3

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/sun/mail/util/logging/SeverityComparator;->compare(JJ)I

    move-result v0

    goto :goto_11
.end method

.method public compareThrowable(Ljava/lang/Throwable;Ljava/lang/Throwable;)I
    .registers 8
    .param p1, "t1"    # Ljava/lang/Throwable;
    .param p2, "t2"    # Ljava/lang/Throwable;

    .prologue
    const/4 v0, 0x1

    const/4 v1, -0x1

    const/4 v2, 0x0

    .line 179
    if-ne p1, p2, :cond_6

    .line 215
    :cond_5
    :goto_5
    return v2

    .line 184
    :cond_6
    if-nez p1, :cond_12

    .line 185
    invoke-virtual {p0, p2}, Lcom/sun/mail/util/logging/SeverityComparator;->isNormal(Ljava/lang/Throwable;)Z

    move-result v2

    if-eqz v2, :cond_10

    :goto_e
    move v2, v0

    goto :goto_5

    :cond_10
    move v0, v1

    goto :goto_e

    .line 187
    :cond_12
    if-nez p2, :cond_1e

    .line 188
    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/SeverityComparator;->isNormal(Ljava/lang/Throwable;)Z

    move-result v2

    if-eqz v2, :cond_1c

    :goto_1a
    move v2, v1

    goto :goto_5

    :cond_1c
    move v1, v0

    goto :goto_1a

    .line 194
    :cond_1e
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_5

    .line 199
    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/SeverityComparator;->isNormal(Ljava/lang/Throwable;)Z

    move-result v3

    if-eqz v3, :cond_37

    .line 200
    invoke-virtual {p0, p2}, Lcom/sun/mail/util/logging/SeverityComparator;->isNormal(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_35

    move v1, v2

    :cond_35
    move v2, v1

    goto :goto_5

    .line 202
    :cond_37
    invoke-virtual {p0, p2}, Lcom/sun/mail/util/logging/SeverityComparator;->isNormal(Ljava/lang/Throwable;)Z

    move-result v3

    if-eqz v3, :cond_3f

    move v2, v0

    .line 203
    goto :goto_5

    .line 209
    :cond_3f
    instance-of v3, p1, Ljava/lang/Error;

    if-eqz v3, :cond_49

    .line 210
    instance-of v1, p2, Ljava/lang/Error;

    if-nez v1, :cond_5

    move v2, v0

    goto :goto_5

    .line 211
    :cond_49
    instance-of v3, p1, Ljava/lang/RuntimeException;

    if-eqz v3, :cond_5b

    .line 212
    instance-of v3, p2, Ljava/lang/Error;

    if-eqz v3, :cond_53

    :goto_51
    move v2, v1

    goto :goto_5

    :cond_53
    instance-of v1, p2, Ljava/lang/RuntimeException;

    if-eqz v1, :cond_59

    move v1, v2

    goto :goto_51

    :cond_59
    move v1, v0

    goto :goto_51

    .line 215
    :cond_5b
    instance-of v0, p2, Ljava/lang/Error;

    if-nez v0, :cond_63

    instance-of v0, p2, Ljava/lang/RuntimeException;

    if-eqz v0, :cond_5

    :cond_63
    move v2, v1

    goto :goto_5
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 258
    if-nez p1, :cond_4

    :cond_3
    :goto_3
    return v0

    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v1, v2, :cond_3

    const/4 v0, 0x1

    goto :goto_3
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 263
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    return v0
.end method

.method public isNormal(Ljava/lang/Throwable;)Z
    .registers 9
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 279
    if-nez p1, :cond_5

    .line 300
    :cond_4
    :goto_4
    return v3

    .line 286
    :cond_5
    const-class v2, Ljava/lang/Throwable;

    .line 287
    .local v2, "root":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Ljava/lang/Error;

    .line 288
    .local v1, "error":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_d
    if-eq v0, v2, :cond_4

    .line 289
    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_23

    .line 290
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "java.lang.ThreadDeath"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_31

    move v3, v4

    .line 291
    goto :goto_4

    .line 295
    :cond_23
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Interrupt"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_31

    move v3, v4

    .line 296
    goto :goto_4

    .line 288
    :cond_31
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_d
.end method
