.class public Lcom/drew/metadata/Age;
.super Ljava/lang/Object;
.source "Age.java"


# instance fields
.field private final _days:I

.field private final _hours:I

.field private final _minutes:I

.field private final _months:I

.field private final _seconds:I

.field private final _years:I


# direct methods
.method public constructor <init>(IIIIII)V
    .registers 7
    .param p1, "years"    # I
    .param p2, "months"    # I
    .param p3, "days"    # I
    .param p4, "hours"    # I
    .param p5, "minutes"    # I
    .param p6, "seconds"    # I

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput p1, p0, Lcom/drew/metadata/Age;->_years:I

    .line 78
    iput p2, p0, Lcom/drew/metadata/Age;->_months:I

    .line 79
    iput p3, p0, Lcom/drew/metadata/Age;->_days:I

    .line 80
    iput p4, p0, Lcom/drew/metadata/Age;->_hours:I

    .line 81
    iput p5, p0, Lcom/drew/metadata/Age;->_minutes:I

    .line 82
    iput p6, p0, Lcom/drew/metadata/Age;->_seconds:I

    .line 83
    return-void
.end method

.method private static appendAgePart(Ljava/lang/StringBuilder;ILjava/lang/String;)V
    .registers 5
    .param p0, "result"    # Ljava/lang/StringBuilder;
    .param p1, "num"    # I
    .param p2, "singularName"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0x20

    .line 135
    if-nez p1, :cond_5

    .line 142
    :cond_4
    :goto_4
    return-void

    .line 137
    :cond_5
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-eqz v0, :cond_e

    .line 138
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 139
    :cond_e
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    const/4 v0, 0x1

    if-eq p1, v0, :cond_4

    .line 141
    const/16 v0, 0x73

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_4
.end method

.method public static fromPanasonicString(Ljava/lang/String;)Lcom/drew/metadata/Age;
    .registers 11
    .param p0, "s"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/16 v9, 0x13

    .line 53
    if-nez p0, :cond_b

    .line 54
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 56
    :cond_b
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v0, v9, :cond_19

    const-string v0, "9999:99:99"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1b

    :cond_19
    move-object v0, v8

    .line 71
    :goto_1a
    return-object v0

    .line 60
    :cond_1b
    const/4 v0, 0x0

    const/4 v9, 0x4

    :try_start_1d
    invoke-virtual {p0, v0, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 61
    .local v1, "years":I
    const/4 v0, 0x5

    const/4 v9, 0x7

    invoke-virtual {p0, v0, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 62
    .local v2, "months":I
    const/16 v0, 0x8

    const/16 v9, 0xa

    invoke-virtual {p0, v0, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 63
    .local v3, "days":I
    const/16 v0, 0xb

    const/16 v9, 0xd

    invoke-virtual {p0, v0, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 64
    .local v4, "hours":I
    const/16 v0, 0xe

    const/16 v9, 0x10

    invoke-virtual {p0, v0, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 65
    .local v5, "minutes":I
    const/16 v0, 0x11

    const/16 v9, 0x13

    invoke-virtual {p0, v0, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 67
    .local v6, "seconds":I
    new-instance v0, Lcom/drew/metadata/Age;

    invoke-direct/range {v0 .. v6}, Lcom/drew/metadata/Age;-><init>(IIIIII)V
    :try_end_64
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_64} :catch_65

    goto :goto_1a

    .line 69
    .end local v1    # "years":I
    .end local v2    # "months":I
    .end local v3    # "days":I
    .end local v4    # "hours":I
    .end local v5    # "minutes":I
    .end local v6    # "seconds":I
    :catch_65
    move-exception v7

    .local v7, "ignored":Ljava/lang/NumberFormatException;
    move-object v0, v8

    .line 71
    goto :goto_1a
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 147
    if-ne p0, p1, :cond_5

    .line 159
    :cond_4
    :goto_4
    return v1

    .line 148
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 150
    check-cast v0, Lcom/drew/metadata/Age;

    .line 152
    .local v0, "age":Lcom/drew/metadata/Age;
    iget v3, p0, Lcom/drew/metadata/Age;->_days:I

    iget v4, v0, Lcom/drew/metadata/Age;->_days:I

    if-eq v3, v4, :cond_1e

    move v1, v2

    goto :goto_4

    .line 153
    :cond_1e
    iget v3, p0, Lcom/drew/metadata/Age;->_hours:I

    iget v4, v0, Lcom/drew/metadata/Age;->_hours:I

    if-eq v3, v4, :cond_26

    move v1, v2

    goto :goto_4

    .line 154
    :cond_26
    iget v3, p0, Lcom/drew/metadata/Age;->_minutes:I

    iget v4, v0, Lcom/drew/metadata/Age;->_minutes:I

    if-eq v3, v4, :cond_2e

    move v1, v2

    goto :goto_4

    .line 155
    :cond_2e
    iget v3, p0, Lcom/drew/metadata/Age;->_months:I

    iget v4, v0, Lcom/drew/metadata/Age;->_months:I

    if-eq v3, v4, :cond_36

    move v1, v2

    goto :goto_4

    .line 156
    :cond_36
    iget v3, p0, Lcom/drew/metadata/Age;->_seconds:I

    iget v4, v0, Lcom/drew/metadata/Age;->_seconds:I

    if-eq v3, v4, :cond_3e

    move v1, v2

    goto :goto_4

    .line 157
    :cond_3e
    iget v3, p0, Lcom/drew/metadata/Age;->_years:I

    iget v4, v0, Lcom/drew/metadata/Age;->_years:I

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public getDays()I
    .registers 2

    .prologue
    .line 97
    iget v0, p0, Lcom/drew/metadata/Age;->_days:I

    return v0
.end method

.method public getHours()I
    .registers 2

    .prologue
    .line 102
    iget v0, p0, Lcom/drew/metadata/Age;->_hours:I

    return v0
.end method

.method public getMinutes()I
    .registers 2

    .prologue
    .line 107
    iget v0, p0, Lcom/drew/metadata/Age;->_minutes:I

    return v0
.end method

.method public getMonths()I
    .registers 2

    .prologue
    .line 92
    iget v0, p0, Lcom/drew/metadata/Age;->_months:I

    return v0
.end method

.method public getSeconds()I
    .registers 2

    .prologue
    .line 112
    iget v0, p0, Lcom/drew/metadata/Age;->_seconds:I

    return v0
.end method

.method public getYears()I
    .registers 2

    .prologue
    .line 87
    iget v0, p0, Lcom/drew/metadata/Age;->_years:I

    return v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 165
    iget v0, p0, Lcom/drew/metadata/Age;->_years:I

    .line 166
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/drew/metadata/Age;->_months:I

    add-int v0, v1, v2

    .line 167
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/drew/metadata/Age;->_days:I

    add-int v0, v1, v2

    .line 168
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/drew/metadata/Age;->_hours:I

    add-int v0, v1, v2

    .line 169
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/drew/metadata/Age;->_minutes:I

    add-int v0, v1, v2

    .line 170
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/drew/metadata/Age;->_seconds:I

    add-int v0, v1, v2

    .line 171
    return v0
.end method

.method public toFriendlyString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .local v0, "result":Ljava/lang/StringBuilder;
    iget v1, p0, Lcom/drew/metadata/Age;->_years:I

    const-string v2, "year"

    invoke-static {v0, v1, v2}, Lcom/drew/metadata/Age;->appendAgePart(Ljava/lang/StringBuilder;ILjava/lang/String;)V

    .line 125
    iget v1, p0, Lcom/drew/metadata/Age;->_months:I

    const-string v2, "month"

    invoke-static {v0, v1, v2}, Lcom/drew/metadata/Age;->appendAgePart(Ljava/lang/StringBuilder;ILjava/lang/String;)V

    .line 126
    iget v1, p0, Lcom/drew/metadata/Age;->_days:I

    const-string v2, "day"

    invoke-static {v0, v1, v2}, Lcom/drew/metadata/Age;->appendAgePart(Ljava/lang/StringBuilder;ILjava/lang/String;)V

    .line 127
    iget v1, p0, Lcom/drew/metadata/Age;->_hours:I

    const-string v2, "hour"

    invoke-static {v0, v1, v2}, Lcom/drew/metadata/Age;->appendAgePart(Ljava/lang/StringBuilder;ILjava/lang/String;)V

    .line 128
    iget v1, p0, Lcom/drew/metadata/Age;->_minutes:I

    const-string v2, "minute"

    invoke-static {v0, v1, v2}, Lcom/drew/metadata/Age;->appendAgePart(Ljava/lang/StringBuilder;ILjava/lang/String;)V

    .line 129
    iget v1, p0, Lcom/drew/metadata/Age;->_seconds:I

    const-string v2, "second"

    invoke-static {v0, v1, v2}, Lcom/drew/metadata/Age;->appendAgePart(Ljava/lang/StringBuilder;ILjava/lang/String;)V

    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 118
    const-string v0, "%04d:%02d:%02d %02d:%02d:%02d"

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/drew/metadata/Age;->_years:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/drew/metadata/Age;->_months:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget v3, p0, Lcom/drew/metadata/Age;->_days:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget v3, p0, Lcom/drew/metadata/Age;->_hours:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget v3, p0, Lcom/drew/metadata/Age;->_minutes:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    iget v3, p0, Lcom/drew/metadata/Age;->_seconds:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
