.class public final Lfreemarker/template/Version;
.super Ljava/lang/Object;
.source "Version.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private final buildDate:Ljava/util/Date;

.field private final extraInfo:Ljava/lang/String;

.field private final gaeCompliant:Ljava/lang/Boolean;

.field private hashCode:Ljava/lang/Integer;

.field private intValue:I

.field private final major:I

.field private final micro:I

.field private final minor:I

.field private stringValue:Ljava/lang/String;


# direct methods
.method public constructor <init>(III)V
    .registers 11
    .param p1, "major"    # I
    .param p2, "minor"    # I
    .param p3, "micro"    # I

    .prologue
    const/4 v4, 0x0

    .line 87
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v6}, Lfreemarker/template/Version;-><init>(IIILjava/lang/String;Ljava/lang/Boolean;Ljava/util/Date;)V

    .line 88
    return-void
.end method

.method public constructor <init>(IIILjava/lang/String;Ljava/lang/Boolean;Ljava/util/Date;)V
    .registers 7
    .param p1, "major"    # I
    .param p2, "minor"    # I
    .param p3, "micro"    # I
    .param p4, "extraInfo"    # Ljava/lang/String;
    .param p5, "gaeCompatible"    # Ljava/lang/Boolean;
    .param p6, "buildDate"    # Ljava/util/Date;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput p1, p0, Lfreemarker/template/Version;->major:I

    .line 92
    iput p2, p0, Lfreemarker/template/Version;->minor:I

    .line 93
    iput p3, p0, Lfreemarker/template/Version;->micro:I

    .line 94
    iput-object p4, p0, Lfreemarker/template/Version;->extraInfo:Ljava/lang/String;

    .line 95
    iput-object p5, p0, Lfreemarker/template/Version;->gaeCompliant:Ljava/lang/Boolean;

    .line 96
    iput-object p6, p0, Lfreemarker/template/Version;->buildDate:Ljava/util/Date;

    .line 97
    invoke-direct {p0}, Lfreemarker/template/Version;->calculateIntValue()V

    .line 98
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "stringValue"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 32
    invoke-direct {p0, p1, v0, v0}, Lfreemarker/template/Version;-><init>(Ljava/lang/String;Ljava/lang/Boolean;Ljava/util/Date;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Boolean;Ljava/util/Date;)V
    .registers 14
    .param p1, "stringValue"    # Ljava/lang/String;
    .param p2, "gaeCompliant"    # Ljava/lang/Boolean;
    .param p3, "buildDate"    # Ljava/util/Date;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 38
    const/4 v7, 0x3

    new-array v5, v7, [I

    .line 39
    .local v5, "parts":[I
    const/4 v1, 0x0

    .line 41
    .local v1, "extraInfoTmp":Ljava/lang/String;
    const/4 v4, 0x0

    .line 42
    .local v4, "partIdx":I
    const/4 v6, 0x0

    .line 43
    .local v6, "valid":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_e
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v3, v7, :cond_38

    .line 44
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 45
    .local v0, "c":C
    const/16 v7, 0x30

    if-lt v0, v7, :cond_2d

    const/16 v7, 0x39

    if-gt v0, v7, :cond_2d

    .line 46
    aget v7, v5, v4

    mul-int/lit8 v7, v7, 0xa

    add-int/lit8 v8, v0, -0x30

    add-int/2addr v7, v8

    aput v7, v5, v4

    .line 47
    const/4 v6, 0x1

    .line 43
    :goto_2a
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 49
    :cond_2d
    const/16 v7, 0x2e

    if-ne v0, v7, :cond_60

    .line 50
    const/4 v7, 0x2

    if-ne v4, v7, :cond_5d

    .line 51
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 62
    .end local v0    # "c":C
    :cond_38
    :goto_38
    if-nez v6, :cond_65

    new-instance v7, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "A version number string "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-static {p1}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, " must start with a number."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 54
    .restart local v0    # "c":C
    :cond_5d
    add-int/lit8 v4, v4, 0x1

    goto :goto_2a

    .line 57
    :cond_60
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 58
    goto :goto_38

    .line 66
    .end local v0    # "c":C
    :cond_65
    if-eqz v1, :cond_7d

    .line 67
    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 68
    .local v2, "firstChar":C
    const/16 v7, 0x2e

    if-eq v2, v7, :cond_78

    const/16 v7, 0x2d

    if-eq v2, v7, :cond_78

    const/16 v7, 0x5f

    if-ne v2, v7, :cond_7d

    .line 69
    :cond_78
    const/4 v7, 0x1

    invoke-virtual {v1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 73
    .end local v2    # "firstChar":C
    :cond_7d
    iput-object v1, p0, Lfreemarker/template/Version;->extraInfo:Ljava/lang/String;

    .line 75
    const/4 v7, 0x0

    aget v7, v5, v7

    iput v7, p0, Lfreemarker/template/Version;->major:I

    .line 76
    const/4 v7, 0x1

    aget v7, v5, v7

    iput v7, p0, Lfreemarker/template/Version;->minor:I

    .line 77
    const/4 v7, 0x2

    aget v7, v5, v7

    iput v7, p0, Lfreemarker/template/Version;->micro:I

    .line 78
    invoke-direct {p0}, Lfreemarker/template/Version;->calculateIntValue()V

    .line 80
    iput-object p1, p0, Lfreemarker/template/Version;->stringValue:Ljava/lang/String;

    .line 81
    iput-object p2, p0, Lfreemarker/template/Version;->gaeCompliant:Ljava/lang/Boolean;

    .line 82
    iput-object p3, p0, Lfreemarker/template/Version;->buildDate:Ljava/util/Date;

    .line 84
    return-void
.end method

.method private calculateIntValue()V
    .registers 4

    .prologue
    .line 101
    iget v0, p0, Lfreemarker/template/Version;->major:I

    iget v1, p0, Lfreemarker/template/Version;->minor:I

    iget v2, p0, Lfreemarker/template/Version;->micro:I

    invoke-static {v0, v1, v2}, Lfreemarker/template/Version;->intValueFor(III)I

    move-result v0

    iput v0, p0, Lfreemarker/template/Version;->intValue:I

    .line 102
    return-void
.end method

.method public static intValueFor(III)I
    .registers 5
    .param p0, "major"    # I
    .param p1, "minor"    # I
    .param p2, "micro"    # I

    .prologue
    .line 105
    const v0, 0xf4240

    mul-int/2addr v0, p0

    mul-int/lit16 v1, p1, 0x3e8

    add-int/2addr v0, v1

    add-int/2addr v0, p2

    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 187
    if-ne p0, p1, :cond_5

    .line 215
    :cond_4
    :goto_4
    return v1

    .line 188
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    goto :goto_4

    .line 189
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_15

    move v1, v2

    goto :goto_4

    :cond_15
    move-object v0, p1

    .line 191
    check-cast v0, Lfreemarker/template/Version;

    .line 193
    .local v0, "other":Lfreemarker/template/Version;
    iget v3, p0, Lfreemarker/template/Version;->intValue:I

    iget v4, v0, Lfreemarker/template/Version;->intValue:I

    if-eq v3, v4, :cond_20

    move v1, v2

    goto :goto_4

    .line 195
    :cond_20
    invoke-virtual {v0}, Lfreemarker/template/Version;->hashCode()I

    move-result v3

    invoke-virtual {p0}, Lfreemarker/template/Version;->hashCode()I

    move-result v4

    if-eq v3, v4, :cond_2c

    move v1, v2

    goto :goto_4

    .line 197
    :cond_2c
    iget-object v3, p0, Lfreemarker/template/Version;->buildDate:Ljava/util/Date;

    if-nez v3, :cond_36

    .line 198
    iget-object v3, v0, Lfreemarker/template/Version;->buildDate:Ljava/util/Date;

    if-eqz v3, :cond_42

    move v1, v2

    goto :goto_4

    .line 199
    :cond_36
    iget-object v3, p0, Lfreemarker/template/Version;->buildDate:Ljava/util/Date;

    iget-object v4, v0, Lfreemarker/template/Version;->buildDate:Ljava/util/Date;

    invoke-virtual {v3, v4}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_42

    move v1, v2

    .line 200
    goto :goto_4

    .line 203
    :cond_42
    iget-object v3, p0, Lfreemarker/template/Version;->extraInfo:Ljava/lang/String;

    if-nez v3, :cond_4c

    .line 204
    iget-object v3, v0, Lfreemarker/template/Version;->extraInfo:Ljava/lang/String;

    if-eqz v3, :cond_58

    move v1, v2

    goto :goto_4

    .line 205
    :cond_4c
    iget-object v3, p0, Lfreemarker/template/Version;->extraInfo:Ljava/lang/String;

    iget-object v4, v0, Lfreemarker/template/Version;->extraInfo:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_58

    move v1, v2

    .line 206
    goto :goto_4

    .line 209
    :cond_58
    iget-object v3, p0, Lfreemarker/template/Version;->gaeCompliant:Ljava/lang/Boolean;

    if-nez v3, :cond_62

    .line 210
    iget-object v3, v0, Lfreemarker/template/Version;->gaeCompliant:Ljava/lang/Boolean;

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_4

    .line 211
    :cond_62
    iget-object v3, p0, Lfreemarker/template/Version;->gaeCompliant:Ljava/lang/Boolean;

    iget-object v4, v0, Lfreemarker/template/Version;->gaeCompliant:Ljava/lang/Boolean;

    invoke-virtual {v3, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 212
    goto :goto_4
.end method

.method public getBuildDate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lfreemarker/template/Version;->buildDate:Ljava/util/Date;

    return-object v0
.end method

.method public getExtraInfo()Ljava/lang/String;
    .registers 2

    .prologue
    .line 147
    iget-object v0, p0, Lfreemarker/template/Version;->extraInfo:Ljava/lang/String;

    return-object v0
.end method

.method public getMajor()I
    .registers 2

    .prologue
    .line 123
    iget v0, p0, Lfreemarker/template/Version;->major:I

    return v0
.end method

.method public getMicro()I
    .registers 2

    .prologue
    .line 137
    iget v0, p0, Lfreemarker/template/Version;->micro:I

    return v0
.end method

.method public getMinor()I
    .registers 2

    .prologue
    .line 130
    iget v0, p0, Lfreemarker/template/Version;->minor:I

    return v0
.end method

.method public hashCode()I
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 172
    iget-object v2, p0, Lfreemarker/template/Version;->hashCode:Ljava/lang/Integer;

    if-nez v2, :cond_3f

    .line 173
    const/16 v0, 0x1f

    .line 174
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 175
    .local v1, "result":I
    iget-object v2, p0, Lfreemarker/template/Version;->buildDate:Ljava/util/Date;

    if-nez v2, :cond_46

    move v2, v3

    :goto_d
    add-int/lit8 v1, v2, 0x1f

    .line 176
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lfreemarker/template/Version;->extraInfo:Ljava/lang/String;

    if-nez v2, :cond_4d

    move v2, v3

    :goto_16
    add-int v1, v4, v2

    .line 177
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lfreemarker/template/Version;->gaeCompliant:Ljava/lang/Boolean;

    if-nez v2, :cond_54

    move v2, v3

    :goto_1f
    add-int v1, v4, v2

    .line 178
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lfreemarker/template/Version;->hashCode:Ljava/lang/Integer;

    if-nez v2, :cond_5b

    move v2, v3

    :goto_28
    add-int v1, v4, v2

    .line 179
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lfreemarker/template/Version;->intValue:I

    add-int v1, v2, v4

    .line 180
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lfreemarker/template/Version;->stringValue:Ljava/lang/String;

    if-nez v4, :cond_62

    :goto_36
    add-int v1, v2, v3

    .line 181
    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v1}, Ljava/lang/Integer;-><init>(I)V

    iput-object v2, p0, Lfreemarker/template/Version;->hashCode:Ljava/lang/Integer;

    .line 183
    .end local v0    # "prime":I
    .end local v1    # "result":I
    :cond_3f
    iget-object v2, p0, Lfreemarker/template/Version;->hashCode:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    return v2

    .line 175
    .restart local v0    # "prime":I
    .restart local v1    # "result":I
    :cond_46
    iget-object v2, p0, Lfreemarker/template/Version;->buildDate:Ljava/util/Date;

    invoke-virtual {v2}, Ljava/util/Date;->hashCode()I

    move-result v2

    goto :goto_d

    .line 176
    :cond_4d
    iget-object v2, p0, Lfreemarker/template/Version;->extraInfo:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_16

    .line 177
    :cond_54
    iget-object v2, p0, Lfreemarker/template/Version;->gaeCompliant:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->hashCode()I

    move-result v2

    goto :goto_1f

    .line 178
    :cond_5b
    iget-object v2, p0, Lfreemarker/template/Version;->hashCode:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->hashCode()I

    move-result v2

    goto :goto_28

    .line 180
    :cond_62
    iget-object v3, p0, Lfreemarker/template/Version;->stringValue:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_36
.end method

.method public intValue()I
    .registers 2

    .prologue
    .line 168
    iget v0, p0, Lfreemarker/template/Version;->intValue:I

    return v0
.end method

.method public isGAECompliant()Ljava/lang/Boolean;
    .registers 2

    .prologue
    .line 154
    iget-object v0, p0, Lfreemarker/template/Version;->gaeCompliant:Ljava/lang/Boolean;

    return-object v0
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 112
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lfreemarker/template/Version;->stringValue:Ljava/lang/String;

    if-nez v0, :cond_4f

    .line 113
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget v1, p0, Lfreemarker/template/Version;->major:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget v1, p0, Lfreemarker/template/Version;->minor:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget v1, p0, Lfreemarker/template/Version;->micro:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/template/Version;->stringValue:Ljava/lang/String;

    .line 114
    iget-object v0, p0, Lfreemarker/template/Version;->extraInfo:Ljava/lang/String;

    if-eqz v0, :cond_4f

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/template/Version;->stringValue:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/template/Version;->extraInfo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/template/Version;->stringValue:Ljava/lang/String;

    .line 116
    :cond_4f
    iget-object v0, p0, Lfreemarker/template/Version;->stringValue:Ljava/lang/String;
    :try_end_51
    .catchall {:try_start_1 .. :try_end_51} :catchall_53

    monitor-exit p0

    return-object v0

    .line 112
    :catchall_53
    move-exception v0

    monitor-exit p0

    throw v0
.end method
