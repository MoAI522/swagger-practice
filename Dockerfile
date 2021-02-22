FROM swaggerapi/swagger-codegen-cli as builder
WORKDIR /mock-seed
COPY ./swagger.yaml ./
WORKDIR /mock-server
RUN java -jar /opt/swagger-codegen-cli/swagger-codegen-cli.jar \
  generate -i /mock-seed/swagger.yaml -l nodejs-server -o ./

FROM node as executor
WORKDIR /mock-server
COPY --from=builder /mock-server ./
RUN npm install
EXPOSE 8080
CMD ["npm", "start"]
