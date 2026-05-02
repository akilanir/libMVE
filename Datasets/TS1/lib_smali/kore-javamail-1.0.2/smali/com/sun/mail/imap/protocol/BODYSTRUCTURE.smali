.class public Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;
.super Ljava/lang/Object;
.source "BODYSTRUCTURE.java"

# interfaces
.implements Lcom/sun/mail/imap/protocol/Item;


# static fields
.field private static MULTI:I

.field private static NESTED:I

.field private static SINGLE:I

.field static final name:[C

.field private static parseDebug:Z


# instance fields
.field public attachment:Ljava/lang/String;

.field public bodies:[Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

.field public cParams:Lkorex/mail/internet/ParameterList;

.field public dParams:Lkorex/mail/internet/ParameterList;

.field public description:Ljava/lang/String;

.field public disposition:Ljava/lang/String;

.field public encoding:Ljava/lang/String;

.field public envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

.field public id:Ljava/lang/String;

.field public language:[Ljava/lang/String;

.field public lines:I

.field public md5:Ljava/lang/String;

.field public msgno:I

.field private processedType:I

.field public size:I

.field public subtype:Ljava/lang/String;

.field public type:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 60
    const/16 v0, 0xd

    new-array v0, v0, [C

    fill-array-data v0, :array_1c

    sput-object v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->name:[C

    .line 81
    const/4 v0, 0x1

    sput v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->SINGLE:I

    .line 82
    const/4 v0, 0x2

    sput v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->MULTI:I

    .line 83
    const/4 v0, 0x3

    sput v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->NESTED:I

    .line 87
    const-string v0, "mail.imap.parse.debug"

    const/4 v1, 0x0

    .line 88
    invoke-static {v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    .line 87
    return-void

    .line 60
    :array_1c
    .array-data 2
        0x42s
        0x4fs
        0x44s
        0x59s
        0x53s
        0x54s
        0x52s
        0x55s
        0x43s
        0x54s
        0x55s
        0x52s
        0x45s
    .end array-data
.end method

.method public constructor <init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V
    .registers 12
    .param p1, "r"    # Lcom/sun/mail/imap/protocol/FetchResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    const/4 v7, -0x1

    iput v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->lines:I

    .line 68
    const/4 v7, -0x1

    iput v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->size:I

    .line 92
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_14

    .line 93
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: parsing BODYSTRUCTURE"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 94
    :cond_14
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v7

    iput v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->msgno:I

    .line 95
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_38

    .line 96
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: msgno "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->msgno:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 98
    :cond_38
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->skipSpaces()V

    .line 100
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v7

    const/16 v8, 0x28

    if-eq v7, v8, :cond_4b

    .line 101
    new-instance v7, Lcom/sun/mail/iap/ParsingException;

    const-string v8, "BODYSTRUCTURE parse error: missing ``(\'\' at start"

    invoke-direct {v7, v8}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 104
    :cond_4b
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->peekByte()B

    move-result v7

    const/16 v8, 0x28

    if-ne v7, v8, :cond_217

    .line 105
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_5e

    .line 106
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: parsing multipart"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 107
    :cond_5e
    const-string v7, "multipart"

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->type:Ljava/lang/String;

    .line 108
    sget v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->MULTI:I

    iput v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->processedType:I

    .line 109
    new-instance v6, Ljava/util/ArrayList;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 110
    .local v6, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;>;"
    const/4 v3, 0x1

    .line 112
    .local v3, "i":I
    :cond_6d
    new-instance v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    invoke-direct {v7, p1}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;-><init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->skipSpaces()V

    .line 120
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->peekByte()B

    move-result v7

    const/16 v8, 0x28

    if-eq v7, v8, :cond_6d

    .line 123
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    invoke-interface {v6, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->bodies:[Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    .line 125
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->subtype:Ljava/lang/String;

    .line 126
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_b2

    .line 127
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: subtype "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->subtype:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 129
    :cond_b2
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v7

    const/16 v8, 0x29

    if-ne v7, v8, :cond_c6

    .line 130
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_c5

    .line 131
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: parse DONE"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 390
    .end local v3    # "i":I
    .end local v6    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;>;"
    :cond_c5
    :goto_c5
    return-void

    .line 137
    .restart local v3    # "i":I
    .restart local v6    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;>;"
    :cond_c6
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_d1

    .line 138
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: parsing extension data"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 140
    :cond_d1
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseParameters(Lcom/sun/mail/iap/Response;)Lkorex/mail/internet/ParameterList;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->cParams:Lkorex/mail/internet/ParameterList;

    .line 141
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v7

    const/16 v8, 0x29

    if-ne v7, v8, :cond_eb

    .line 142
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_c5

    .line 143
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: body parameters DONE"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_c5

    .line 148
    :cond_eb
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v0

    .line 149
    .local v0, "b":B
    const/16 v7, 0x28

    if-ne v0, v7, :cond_158

    .line 150
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_fe

    .line 151
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: parse disposition"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 152
    :cond_fe
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->disposition:Ljava/lang/String;

    .line 153
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_122

    .line 154
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: disposition "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->disposition:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 156
    :cond_122
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseParameters(Lcom/sun/mail/iap/Response;)Lkorex/mail/internet/ParameterList;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->dParams:Lkorex/mail/internet/ParameterList;

    .line 157
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v7

    const/16 v8, 0x29

    if-eq v7, v8, :cond_138

    .line 158
    new-instance v7, Lcom/sun/mail/iap/ParsingException;

    const-string v8, "BODYSTRUCTURE parse error: missing ``)\'\' at end of disposition in multipart"

    invoke-direct {v7, v8}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 161
    :cond_138
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_143

    .line 162
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: disposition DONE"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 176
    :cond_143
    :goto_143
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v0

    const/16 v7, 0x29

    if-ne v0, v7, :cond_1a7

    .line 177
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_c5

    .line 178
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: no body-fld-lang"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_c5

    .line 163
    :cond_158
    const/16 v7, 0x4e

    if-eq v0, v7, :cond_160

    const/16 v7, 0x6e

    if-ne v0, v7, :cond_170

    .line 164
    :cond_160
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_16b

    .line 165
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: disposition NIL"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 166
    :cond_16b
    const/4 v7, 0x2

    invoke-virtual {p1, v7}, Lcom/sun/mail/imap/protocol/FetchResponse;->skip(I)V

    goto :goto_143

    .line 168
    :cond_170
    new-instance v7, Lcom/sun/mail/iap/ParsingException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "BODYSTRUCTURE parse error: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->type:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->subtype:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "bad multipart disposition, b "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 182
    :cond_1a7
    const/16 v7, 0x20

    if-eq v0, v7, :cond_1b3

    .line 183
    new-instance v7, Lcom/sun/mail/iap/ParsingException;

    const-string v8, "BODYSTRUCTURE parse error: missing space after disposition"

    invoke-direct {v7, v8}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 188
    :cond_1b3
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->peekByte()B

    move-result v7

    const/16 v8, 0x28

    if-ne v7, v8, :cond_1ec

    .line 189
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readStringList()[Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->language:[Ljava/lang/String;

    .line 190
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_1e0

    .line 191
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: language len "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->language:[Ljava/lang/String;

    array-length v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 207
    :cond_1e0
    :goto_1e0
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v7

    const/16 v8, 0x20

    if-ne v7, v8, :cond_c5

    .line 208
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseBodyExtension(Lcom/sun/mail/iap/Response;)V

    goto :goto_1e0

    .line 194
    :cond_1ec
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v4

    .line 195
    .local v4, "l":Ljava/lang/String;
    if-eqz v4, :cond_1e0

    .line 196
    const/4 v7, 0x1

    new-array v5, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v4, v5, v7

    .line 197
    .local v5, "la":[Ljava/lang/String;
    iput-object v5, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->language:[Ljava/lang/String;

    .line 198
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_1e0

    .line 199
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: language "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1e0

    .line 209
    .end local v0    # "b":B
    .end local v3    # "i":I
    .end local v4    # "l":Ljava/lang/String;
    .end local v5    # "la":[Ljava/lang/String;
    .end local v6    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;>;"
    :cond_217
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->peekByte()B

    move-result v7

    const/16 v8, 0x29

    if-ne v7, v8, :cond_227

    .line 228
    new-instance v7, Lcom/sun/mail/iap/ParsingException;

    const-string v8, "BODYSTRUCTURE parse error: missing body content"

    invoke-direct {v7, v8}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 231
    :cond_227
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_232

    .line 232
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: single part"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 233
    :cond_232
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->type:Ljava/lang/String;

    .line 234
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_256

    .line 235
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: type "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->type:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 236
    :cond_256
    sget v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->SINGLE:I

    iput v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->processedType:I

    .line 237
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->subtype:Ljava/lang/String;

    .line 238
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_27e

    .line 239
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: subtype "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->subtype:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 242
    :cond_27e
    iget-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->type:Ljava/lang/String;

    if-nez v7, :cond_28a

    .line 243
    const-string v7, "application"

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->type:Ljava/lang/String;

    .line 244
    const-string v7, "octet-stream"

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->subtype:Ljava/lang/String;

    .line 246
    :cond_28a
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseParameters(Lcom/sun/mail/iap/Response;)Lkorex/mail/internet/ParameterList;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->cParams:Lkorex/mail/internet/ParameterList;

    .line 247
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_2ae

    .line 248
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: cParams "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->cParams:Lkorex/mail/internet/ParameterList;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 249
    :cond_2ae
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->id:Ljava/lang/String;

    .line 250
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_2d2

    .line 251
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: id "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->id:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 252
    :cond_2d2
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->description:Ljava/lang/String;

    .line 253
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_2f6

    .line 254
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: description "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->description:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 259
    :cond_2f6
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readAtomString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->encoding:Ljava/lang/String;

    .line 260
    iget-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->encoding:Ljava/lang/String;

    if-eqz v7, :cond_30d

    iget-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->encoding:Ljava/lang/String;

    const-string v8, "NIL"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_30d

    .line 261
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->encoding:Ljava/lang/String;

    .line 262
    :cond_30d
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_32b

    .line 263
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: encoding "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->encoding:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 264
    :cond_32b
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readNumber()I

    move-result v7

    iput v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->size:I

    .line 265
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_34f

    .line 266
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: size "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->size:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 267
    :cond_34f
    iget v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->size:I

    if-gez v7, :cond_35b

    .line 268
    new-instance v7, Lcom/sun/mail/iap/ParsingException;

    const-string v8, "BODYSTRUCTURE parse error: bad ``size\'\' element"

    invoke-direct {v7, v8}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 272
    :cond_35b
    iget-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->type:Ljava/lang/String;

    const-string v8, "text"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_395

    .line 273
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readNumber()I

    move-result v7

    iput v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->lines:I

    .line 274
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_389

    .line 275
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: lines "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->lines:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 276
    :cond_389
    iget v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->lines:I

    if-gez v7, :cond_412

    .line 277
    new-instance v7, Lcom/sun/mail/iap/ParsingException;

    const-string v8, "BODYSTRUCTURE parse error: bad ``lines\'\' element"

    invoke-direct {v7, v8}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 279
    :cond_395
    iget-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->type:Ljava/lang/String;

    const-string v8, "message"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_42a

    iget-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->subtype:Ljava/lang/String;

    const-string v8, "rfc822"

    .line 280
    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_42a

    .line 282
    sget v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->NESTED:I

    iput v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->processedType:I

    .line 287
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->skipSpaces()V

    .line 288
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->peekByte()B

    move-result v7

    const/16 v8, 0x28

    if-ne v7, v8, :cond_407

    .line 289
    new-instance v7, Lcom/sun/mail/imap/protocol/ENVELOPE;

    invoke-direct {v7, p1}, Lcom/sun/mail/imap/protocol/ENVELOPE;-><init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->envelope:Lcom/sun/mail/imap/protocol/ENVELOPE;

    .line 290
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_3ca

    .line 291
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: got envelope of nested message"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 293
    :cond_3ca
    const/4 v7, 0x1

    new-array v2, v7, [Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    const/4 v7, 0x0

    new-instance v8, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    invoke-direct {v8, p1}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;-><init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V

    aput-object v8, v2, v7

    .line 294
    .local v2, "bs":[Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;
    iput-object v2, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->bodies:[Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    .line 295
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readNumber()I

    move-result v7

    iput v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->lines:I

    .line 296
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_3fb

    .line 297
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: lines "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->lines:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 298
    :cond_3fb
    iget v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->lines:I

    if-gez v7, :cond_412

    .line 299
    new-instance v7, Lcom/sun/mail/iap/ParsingException;

    const-string v8, "BODYSTRUCTURE parse error: bad ``lines\'\' element"

    invoke-direct {v7, v8}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 302
    .end local v2    # "bs":[Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;
    :cond_407
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_412

    .line 303
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: missing envelope and body of nested message"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 317
    :cond_412
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->peekByte()B

    move-result v7

    const/16 v8, 0x29

    if-ne v7, v8, :cond_45f

    .line 318
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    .line 319
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_c5

    .line 320
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: parse DONE"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_c5

    .line 308
    :cond_42a
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->skipSpaces()V

    .line 309
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->peekByte()B

    move-result v1

    .line 310
    .local v1, "bn":B
    int-to-char v7, v1

    invoke-static {v7}, Ljava/lang/Character;->isDigit(C)Z

    move-result v7

    if-eqz v7, :cond_412

    .line 311
    new-instance v7, Lcom/sun/mail/iap/ParsingException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "BODYSTRUCTURE parse error: server erroneously included ``lines\'\' element with type "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->type:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->subtype:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 327
    .end local v1    # "bn":B
    :cond_45f
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->md5:Ljava/lang/String;

    .line 328
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v7

    const/16 v8, 0x29

    if-ne v7, v8, :cond_47a

    .line 329
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_c5

    .line 330
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: no MD5 DONE"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_c5

    .line 335
    :cond_47a
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v0

    .line 336
    .restart local v0    # "b":B
    const/16 v7, 0x28

    if-ne v0, v7, :cond_4da

    .line 337
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->disposition:Ljava/lang/String;

    .line 338
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_4a6

    .line 339
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: disposition "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->disposition:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 341
    :cond_4a6
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseParameters(Lcom/sun/mail/iap/Response;)Lkorex/mail/internet/ParameterList;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->dParams:Lkorex/mail/internet/ParameterList;

    .line 342
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_4ca

    .line 343
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: dParams "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->dParams:Lkorex/mail/internet/ParameterList;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 344
    :cond_4ca
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v7

    const/16 v8, 0x29

    if-eq v7, v8, :cond_4f1

    .line 345
    new-instance v7, Lcom/sun/mail/iap/ParsingException;

    const-string v8, "BODYSTRUCTURE parse error: missing ``)\'\' at end of disposition"

    invoke-direct {v7, v8}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 348
    :cond_4da
    const/16 v7, 0x4e

    if-eq v0, v7, :cond_4e2

    const/16 v7, 0x6e

    if-ne v0, v7, :cond_506

    .line 349
    :cond_4e2
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_4ed

    .line 350
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: disposition NIL"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 351
    :cond_4ed
    const/4 v7, 0x2

    invoke-virtual {p1, v7}, Lcom/sun/mail/imap/protocol/FetchResponse;->skip(I)V

    .line 359
    :cond_4f1
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v7

    const/16 v8, 0x29

    if-ne v7, v8, :cond_53d

    .line 360
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_c5

    .line 361
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: disposition DONE"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_c5

    .line 353
    :cond_506
    new-instance v7, Lcom/sun/mail/iap/ParsingException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "BODYSTRUCTURE parse error: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->type:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->subtype:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "bad single part disposition, b "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 366
    :cond_53d
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->peekByte()B

    move-result v7

    const/16 v8, 0x28

    if-ne v7, v8, :cond_576

    .line 367
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readStringList()[Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->language:[Ljava/lang/String;

    .line 368
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_56a

    .line 369
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: language len "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->language:[Ljava/lang/String;

    array-length v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 385
    :cond_56a
    :goto_56a
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v7

    const/16 v8, 0x20

    if-ne v7, v8, :cond_5a1

    .line 386
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseBodyExtension(Lcom/sun/mail/iap/Response;)V

    goto :goto_56a

    .line 372
    :cond_576
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v4

    .line 373
    .restart local v4    # "l":Ljava/lang/String;
    if-eqz v4, :cond_56a

    .line 374
    const/4 v7, 0x1

    new-array v5, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v4, v5, v7

    .line 375
    .restart local v5    # "la":[Ljava/lang/String;
    iput-object v5, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->language:[Ljava/lang/String;

    .line 376
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_56a

    .line 377
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG IMAP: language "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_56a

    .line 387
    .end local v4    # "l":Ljava/lang/String;
    .end local v5    # "la":[Ljava/lang/String;
    :cond_5a1
    sget-boolean v7, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v7, :cond_c5

    .line 388
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "DEBUG IMAP: all DONE"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_c5
.end method

.method private parseBodyExtension(Lcom/sun/mail/iap/Response;)V
    .registers 5
    .param p1, "r"    # Lcom/sun/mail/iap/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    .line 438
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 440
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->peekByte()B

    move-result v0

    .line 441
    .local v0, "b":B
    const/16 v1, 0x28

    if-ne v0, v1, :cond_1b

    .line 442
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lcom/sun/mail/iap/Response;->skip(I)V

    .line 444
    :cond_f
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseBodyExtension(Lcom/sun/mail/iap/Response;)V

    .line 445
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readByte()B

    move-result v1

    const/16 v2, 0x29

    if-ne v1, v2, :cond_f

    .line 450
    :goto_1a
    return-void

    .line 446
    :cond_1b
    int-to-char v1, v0

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-eqz v1, :cond_26

    .line 447
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readNumber()I

    goto :goto_1a

    .line 449
    :cond_26
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readString()Ljava/lang/String;

    goto :goto_1a
.end method

.method private parseParameters(Lcom/sun/mail/iap/Response;)Lkorex/mail/internet/ParameterList;
    .registers 9
    .param p1, "r"    # Lcom/sun/mail/iap/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    .line 406
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 408
    const/4 v1, 0x0

    .line 409
    .local v1, "list":Lkorex/mail/internet/ParameterList;
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readByte()B

    move-result v0

    .line 410
    .local v0, "b":B
    const/16 v4, 0x28

    if-ne v0, v4, :cond_95

    .line 411
    new-instance v1, Lkorex/mail/internet/ParameterList;

    .end local v1    # "list":Lkorex/mail/internet/ParameterList;
    invoke-direct {v1}, Lkorex/mail/internet/ParameterList;-><init>()V

    .line 413
    .restart local v1    # "list":Lkorex/mail/internet/ParameterList;
    :cond_11
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readString()Ljava/lang/String;

    move-result-object v2

    .line 414
    .local v2, "name":Ljava/lang/String;
    sget-boolean v4, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v4, :cond_31

    .line 415
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "DEBUG IMAP: parameter name "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 416
    :cond_31
    if-nez v2, :cond_66

    .line 417
    new-instance v4, Lcom/sun/mail/iap/ParsingException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "BODYSTRUCTURE parse error: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->type:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->subtype:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "null name in parameter list"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 421
    :cond_66
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readString()Ljava/lang/String;

    move-result-object v3

    .line 422
    .local v3, "value":Ljava/lang/String;
    sget-boolean v4, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v4, :cond_86

    .line 423
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "DEBUG IMAP: parameter value "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 424
    :cond_86
    invoke-virtual {v1, v2, v3}, Lkorex/mail/internet/ParameterList;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 425
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readByte()B

    move-result v4

    const/16 v5, 0x29

    if-ne v4, v5, :cond_11

    .line 426
    invoke-virtual {v1}, Lkorex/mail/internet/ParameterList;->combineSegments()V

    .line 434
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :goto_94
    return-object v1

    .line 427
    :cond_95
    const/16 v4, 0x4e

    if-eq v0, v4, :cond_9d

    const/16 v4, 0x6e

    if-ne v0, v4, :cond_ad

    .line 428
    :cond_9d
    sget-boolean v4, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->parseDebug:Z

    if-eqz v4, :cond_a8

    .line 429
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "DEBUG IMAP: parameter list NIL"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 430
    :cond_a8
    const/4 v4, 0x2

    invoke-virtual {p1, v4}, Lcom/sun/mail/iap/Response;->skip(I)V

    goto :goto_94

    .line 432
    :cond_ad
    new-instance v4, Lcom/sun/mail/iap/ParsingException;

    const-string v5, "Parameter list parse error"

    invoke-direct {v4, v5}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v4
.end method


# virtual methods
.method public isMulti()Z
    .registers 3

    .prologue
    .line 393
    iget v0, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->processedType:I

    sget v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->MULTI:I

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isNested()Z
    .registers 3

    .prologue
    .line 401
    iget v0, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->processedType:I

    sget v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->NESTED:I

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isSingle()Z
    .registers 3

    .prologue
    .line 397
    iget v0, p0, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->processedType:I

    sget v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->SINGLE:I

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
