FROM node:16-alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx AS runner
COPY --from=builder /app/build /usr/share/nginx/html
# No start nginx command necessary because the default command when the container starts up will start nginx