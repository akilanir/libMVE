.class Lkorex/mail/internet/InternetHeaders$MatchEnum;
.super Ljava/lang/Object;
.source "InternetHeaders.java"

# interfaces
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/internet/InternetHeaders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MatchEnum"
.end annotation


# instance fields
.field private e:Ljava/util/Iterator;

.field private match:Z

.field private names:[Ljava/lang/String;

.field private next_header:Lkorex/mail/internet/InternetHeaders$InternetHeader;

.field private want_line:Z


# direct methods
.method constructor <init>(Ljava/util/List;[Ljava/lang/String;ZZ)V
    .registers 6
    .param p1, "v"    # Ljava/util/List;
    .param p2, "n"    # [Ljava/lang/String;
    .param p3, "m"    # Z
    .param p4, "l"    # Z

    .prologue
    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 186
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->e:Ljava/util/Iterator;

    .line 187
    iput-object p2, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->names:[Ljava/lang/String;

    .line 188
    iput-boolean p3, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->match:Z

    .line 189
    iput-boolean p4, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->want_line:Z

    .line 190
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->next_header:Lkorex/mail/internet/InternetHeaders$InternetHeader;

    .line 191
    return-void
.end method

.method private nextMatch()Lkorex/mail/internet/InternetHeaders$InternetHeader;
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 228
    :cond_1
    iget-object v3, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->e:Ljava/util/Iterator;

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_40

    .line 229
    iget-object v3, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->e:Ljava/util/Iterator;

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    .line 232
    .local v0, "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    iget-object v3, v0, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 236
    iget-object v3, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->names:[Ljava/lang/String;

    if-nez v3, :cond_1f

    .line 237
    iget-boolean v3, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->match:Z

    if-eqz v3, :cond_1e

    move-object v0, v2

    .line 255
    .end local v0    # "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    :cond_1e
    :goto_1e
    return-object v0

    .line 240
    .restart local v0    # "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    :cond_1f
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_20
    iget-object v3, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->names:[Ljava/lang/String;

    array-length v3, v3

    if-ge v1, v3, :cond_3b

    .line 241
    iget-object v3, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->names:[Ljava/lang/String;

    aget-object v3, v3, v1

    invoke-virtual {v0}, Lkorex/mail/internet/InternetHeaders$InternetHeader;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_38

    .line 242
    iget-boolean v3, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->match:Z

    if-eqz v3, :cond_1

    goto :goto_1e

    .line 240
    :cond_38
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 252
    :cond_3b
    iget-boolean v3, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->match:Z

    if-nez v3, :cond_1

    goto :goto_1e

    .end local v0    # "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    .end local v1    # "i":I
    :cond_40
    move-object v0, v2

    .line 255
    goto :goto_1e
.end method


# virtual methods
.method public hasMoreElements()Z
    .registers 2

    .prologue
    .line 199
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->next_header:Lkorex/mail/internet/InternetHeaders$InternetHeader;

    if-nez v0, :cond_a

    .line 200
    invoke-direct {p0}, Lkorex/mail/internet/InternetHeaders$MatchEnum;->nextMatch()Lkorex/mail/internet/InternetHeaders$InternetHeader;

    move-result-object v0

    iput-object v0, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->next_header:Lkorex/mail/internet/InternetHeaders$InternetHeader;

    .line 201
    :cond_a
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->next_header:Lkorex/mail/internet/InternetHeaders$InternetHeader;

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public nextElement()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 208
    iget-object v1, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->next_header:Lkorex/mail/internet/InternetHeaders$InternetHeader;

    if-nez v1, :cond_a

    .line 209
    invoke-direct {p0}, Lkorex/mail/internet/InternetHeaders$MatchEnum;->nextMatch()Lkorex/mail/internet/InternetHeaders$InternetHeader;

    move-result-object v1

    iput-object v1, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->next_header:Lkorex/mail/internet/InternetHeaders$InternetHeader;

    .line 211
    :cond_a
    iget-object v1, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->next_header:Lkorex/mail/internet/InternetHeaders$InternetHeader;

    if-nez v1, :cond_16

    .line 212
    new-instance v1, Ljava/util/NoSuchElementException;

    const-string v2, "No more headers"

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 214
    :cond_16
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->next_header:Lkorex/mail/internet/InternetHeaders$InternetHeader;

    .line 215
    .local v0, "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    const/4 v1, 0x0

    iput-object v1, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->next_header:Lkorex/mail/internet/InternetHeaders$InternetHeader;

    .line 216
    iget-boolean v1, p0, Lkorex/mail/internet/InternetHeaders$MatchEnum;->want_line:Z

    if-eqz v1, :cond_22

    .line 217
    iget-object v1, v0, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    .line 219
    :goto_21
    return-object v1

    :cond_22
    new-instance v1, Lkorex/mail/Header;

    invoke-virtual {v0}, Lkorex/mail/internet/InternetHeaders$InternetHeader;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lkorex/mail/internet/InternetHeaders$InternetHeader;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lkorex/mail/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_21
.end method
