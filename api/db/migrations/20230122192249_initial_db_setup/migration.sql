-- CreateEnum
CREATE TYPE "GraphType" AS ENUM ('SimpleLineChart', 'SimpleBarChart', 'SimplePieChart');

-- CreateEnum
CREATE TYPE "DataSourceType" AS ENUM ('SQL', 'REST');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "hashedPassword" TEXT NOT NULL,
    "salt" TEXT NOT NULL,
    "resetToken" TEXT,
    "resetTokenExpiresAt" TIMESTAMP(3),
    "webAuthnChallenge" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserCredential" (
    "id" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "publicKey" BYTEA NOT NULL,
    "transports" TEXT,
    "counter" BIGINT NOT NULL,

    CONSTRAINT "UserCredential_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Graphs" (
    "id" SERIAL NOT NULL,
    "graphName" TEXT NOT NULL,
    "selectedTypeId" INTEGER NOT NULL,
    "creationDate" TIMESTAMP(3) NOT NULL,
    "modifiedDate" TIMESTAMP(3),
    "description" TEXT,
    "selectedDataSourceTypeId" INTEGER NOT NULL,
    "cssOverride" TEXT,

    CONSTRAINT "Graphs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GraphTypes" (
    "id" SERIAL NOT NULL,
    "graphType" "GraphType" NOT NULL,
    "description" TEXT NOT NULL,
    "showLegend" BOOLEAN NOT NULL,
    "defaultCss" TEXT NOT NULL,

    CONSTRAINT "GraphTypes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dataSourceTypes" (
    "id" SERIAL NOT NULL,
    "dataSourceType" "DataSourceType" NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "dataSourceTypes_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_webAuthnChallenge_key" ON "User"("webAuthnChallenge");

-- AddForeignKey
ALTER TABLE "UserCredential" ADD CONSTRAINT "UserCredential_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Graphs" ADD CONSTRAINT "Graphs_selectedTypeId_fkey" FOREIGN KEY ("selectedTypeId") REFERENCES "GraphTypes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Graphs" ADD CONSTRAINT "Graphs_selectedDataSourceTypeId_fkey" FOREIGN KEY ("selectedDataSourceTypeId") REFERENCES "dataSourceTypes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
