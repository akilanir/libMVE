.class Lfreemarker/ext/beans/MemberAndArguments;
.super Ljava/lang/Object;
.source "MemberAndArguments.java"


# instance fields
.field private final args:[Ljava/lang/Object;

.field private final member:Ljava/lang/reflect/Member;


# direct methods
.method constructor <init>(Ljava/lang/reflect/Member;[Ljava/lang/Object;)V
    .registers 3
    .param p1, "member"    # Ljava/lang/reflect/Member;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lfreemarker/ext/beans/MemberAndArguments;->member:Ljava/lang/reflect/Member;

    .line 14
    iput-object p2, p0, Lfreemarker/ext/beans/MemberAndArguments;->args:[Ljava/lang/Object;

    .line 15
    return-void
.end method


# virtual methods
.method getArgs()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 18
    iget-object v0, p0, Lfreemarker/ext/beans/MemberAndArguments;->args:[Ljava/lang/Object;

    return-object v0
.end method

.method public getMember()Ljava/lang/reflect/Member;
    .registers 2

    .prologue
    .line 22
    iget-object v0, p0, Lfreemarker/ext/beans/MemberAndArguments;->member:Ljava/lang/reflect/Member;

    return-object v0
.end method
