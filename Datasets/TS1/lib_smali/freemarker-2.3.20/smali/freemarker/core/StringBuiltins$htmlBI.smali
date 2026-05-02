.class Lfreemarker/core/StringBuiltins$htmlBI;
.super Lfreemarker/core/StringBuiltins$StringBuiltIn;
.source "StringBuiltins.java"

# interfaces
.implements Lfreemarker/core/ICIChainMember;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "htmlBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/StringBuiltins$htmlBI$BIBeforeICE2d3d20;
    }
.end annotation


# static fields
.field private static final MIN_ICE:I


# instance fields
.field private final prevICEObj:Lfreemarker/core/StringBuiltins$htmlBI$BIBeforeICE2d3d20;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 261
    const/4 v0, 0x2

    const/4 v1, 0x3

    const/16 v2, 0x14

    invoke-static {v0, v1, v2}, Lfreemarker/template/Version;->intValueFor(III)I

    move-result v0

    sput v0, Lfreemarker/core/StringBuiltins$htmlBI;->MIN_ICE:I

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    .line 259
    invoke-direct {p0}, Lfreemarker/core/StringBuiltins$StringBuiltIn;-><init>()V

    .line 262
    new-instance v0, Lfreemarker/core/StringBuiltins$htmlBI$BIBeforeICE2d3d20;

    invoke-direct {v0}, Lfreemarker/core/StringBuiltins$htmlBI$BIBeforeICE2d3d20;-><init>()V

    iput-object v0, p0, Lfreemarker/core/StringBuiltins$htmlBI;->prevICEObj:Lfreemarker/core/StringBuiltins$htmlBI$BIBeforeICE2d3d20;

    .line 268
    return-void
.end method


# virtual methods
.method calculateResult(Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 265
    new-instance v0, Lfreemarker/template/SimpleScalar;

    invoke-static {p1}, Lfreemarker/template/utility/StringUtil;->XHTMLEnc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getMinimumICIVersion()I
    .registers 2

    .prologue
    .line 275
    sget v0, Lfreemarker/core/StringBuiltins$htmlBI;->MIN_ICE:I

    return v0
.end method

.method public getPreviousICIChainMember()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 279
    iget-object v0, p0, Lfreemarker/core/StringBuiltins$htmlBI;->prevICEObj:Lfreemarker/core/StringBuiltins$htmlBI$BIBeforeICE2d3d20;

    return-object v0
.end method
