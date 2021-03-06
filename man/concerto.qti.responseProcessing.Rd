% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/concerto.qti.responseProcessing.R
\name{concerto.qti.responseProcessing}
\alias{concerto.qti.responseProcessing}
\title{QTI response processing}
\usage{
concerto.qti.responseProcessing(qtiID, ini, userResponse,
  workspaceID = concerto$workspaceID)
}
\arguments{
\item{qtiID}{QTI object ID or name.}

\item{ini}{Result of QTI initialization.}

\item{userResponse}{Test participant response.}

\item{workspaceID}{Concerto workspace ID where the QTI object is located.}
}
\value{
Named list with elements declared in QTI XML.
}
\description{
Processes QTI response.
}
\examples{
\dontrun{
qti_init <- concerto.qti.initialize(1)
user_response <- concerto.template.show(2)
rp <- concerto.qti.responseProcessing(1, qti_init, user_response)
}
}
\author{
Przemyslaw Lis
}

